class @Scene
  constructor: (@script) ->

  # Mechanics

  start: ->
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut(-> $(this).html(''))
    $('#story').removeClass('last')
    @play()

  play: () -> @script = @script()

  # DSL

  background: (color) -> $('body').css('background-color', color)
  foreground: (color) -> $('#story, article').css('color', color)
  icon: (icon) -> $('#illustration .content').html('<i class="icon-' + icon + '"></i>')

  say: (line, next) -> @story 'me', line, next

  says: (actor, line, next) -> @story actor, line, next

  think: (line, next) -> @story 'thought', line, next

  last: (line, actions) ->
    line()
    actions()

    $('#story').addClass('last')
    $('#action')
      .hide()
      .delay(1500)
      .fadeIn()

    false

  button: (label, goto) ->
    $('#action')
      .append('<a href="#" data-goto="' + goto + '">' + label + '</a>')

  # Internals

  story: (actor, line, next) ->
    $('#story').fadeOut 'fast', =>
      $('#story')
        .html(@render line, actor)
        .attr('data-who', actor)
        .fadeIn()
    next

  render: (line, actor) -> '<div class="who">' + actor + '</div><blockquote>' + line + '</blockquote>'