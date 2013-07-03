class @Engine

  renderScript: (script) -> '<div class="who">' + script.who + '</div><blockquote>' + script.line + '</blockquote>'

  renderAction: (action) -> '<a href="#" data-goto="' + action.goto + '">' + action.label + '</a>'

  render: (scene, step) ->
    $('#story').removeClass('last')
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut()
    $('body').css('background-color', scene.background)
    $('#story, article').css('color', scene.foreground)
    $('#story').html @renderScript(scene.script[step])
    $('#story').attr('data-who', scene.script[step].who)
    $('#illustration .content').html('<i class="icon-' + scene.icon + '"></i>')

  step: (scene, step) ->
    return false if (step >= scene.script.length)

    $('#story').fadeOut 'fast', =>
      $('#story')
        .html(@renderScript(scene.script[step]))
        .attr('data-who', scene.script[step].who)
        .fadeIn()

  action: (scene) ->
    actions = []

    # TODO: Underscore?
    for action in scene.actions
      actions.push @renderAction(action)

    $('#story').addClass('last')
    $('#action')
      .hide()
      .html(actions)
      .delay(1500)
      .fadeIn()