class @Scene
  constructor: (@script) ->

  # Mechanics

  start: ->
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut()
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
    $('#story').addClass('last')
    line()
    actions()

  button: (label, goto) ->
    $('#action')
      .hide()
      .html('<a href="#" data-goto="' + goto + '">' + label + '</a>')
      .delay(1500)
      .fadeIn()
    false

  # Internals

  story: (actor, line, next) ->
    $('#story').fadeOut 'fast', =>
      $('#story')
        .html(@render line, actor)
        .attr('data-who', actor)
        .fadeIn()
    next

  render: (line, actor) -> '<div class="who">' + actor + '</div><blockquote>' + line + '</blockquote>'