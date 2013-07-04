class @Scene
  constructor: (@script) ->

  start: ->
    $('#story').removeClass('last')
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut()

  play: () -> @script = @script()

  background: (color) -> $('body').css('background-color', color)
  foreground: (color) -> $('#story, article').css('color', color)
  icon: (icon) -> $('#illustration .content').html('<i class="icon-' + icon + '"></i>')

  say: (line, next) -> @story 'me', line, next
  says: (actor, line, next) -> @story actor, line, next
  think: (line, next) -> @story 'thought', line, next

  story: (actor, line, next) ->
    $('#story').fadeOut 'fast', =>
      $('#story')
        .html(@render line, actor)
        .attr('data-who', actor)
        .fadeIn()
    next

  render: (line, actor) -> '<div class="who">' + actor + '</div><blockquote>' + line + '</blockquote>'