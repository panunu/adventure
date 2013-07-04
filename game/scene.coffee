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

  say: (line) ->
    $('#story')
      .html(@render line)
      .attr('data-who', scene.script[step].who)

  render: (line, actor = '') -> '<div class="who">' + actor + '</div><blockquote>' + line + '</blockquote>'