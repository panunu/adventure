class @Scene
  constructor: (@script, @database, @bag, @journal) ->

  # Mechanics

  start: ->
    $('article').hide().delay(2000).fadeIn()
    $('#action').hide().html('')
    $('#story').removeClass('last')
    @play()

  play: () -> @script = @script()

  # DSL

  background: (color) -> $('body').css('background-color', color)
  foreground: (color) -> $('#story, article').css('color', color)
  icon: (icon) -> $('#illustration .content').html('<i class="icon-' + icon + '"></i>')

  display: (line, next) -> @story '', line, next
  say: (line, next) -> @story 'me', line, next
  says: (actor, line, next) -> @story actor, line, next
  think: (line, next) -> @story 'thought', line, next

  final: (line) ->
    line()
    $('#story').addClass('last')
    $('#action')
      .hide()
      .delay(1500)
      .fadeIn()
    false

  button: (label, goto) -> $('#action').append('<a href="#" data-goto="' + goto + '">' + label + '</a>')

  write: (entry) -> @journal.write entry

  panic: () -> $('#story').addClass('shake')
  normalize: () -> $('#story').attr('class', '')

  # Internals

  story: (actor, line, next) ->
    $('#story').fadeOut 'fast', =>
      $('#story')
        .html(@render line, actor)
        .attr('data-who', actor)
        .fadeIn()
    next

  render: (line, actor) -> '<div class="who">' + actor + '</div><blockquote>' + line + '</blockquote>'
