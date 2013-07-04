class @Scene
  constructor: (@script) ->

  play: ->
    $('#story').removeClass('last')
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut()
    @script()

  background: (color) -> $('body').css('background-color', color)
  foreground: (color) -> $('#story, article').css('color', color)
  icon: (icon) -> $('#illustration .content').html('<i class="icon-' + icon + '"></i>')

  say: (line, next) -> @story 'me', line
  think: (line, next) -> @story 'thought', line
  says: (actor, line, next) -> @story 'actor', line

  story: (actor, line) ->
    $('#story')
      .html(@render line, actor)
      .attr('data-who', actor)

  render: (line, actor) -> '<div class="who">' + actor + '</div><blockquote>' + line + '</blockquote>'