class @Engine

  #renderAction: (action) -> '<a href="#" data-goto="' + action.goto + '">' + action.label + '</a>'

  start: (scene) ->
    (scene = new Scene(scene)).start()
    scene.play()

  play: (scene) ->
    scene.play()

  ###next: (scene) ->
    #return false if (step >= scene.script.length)

###

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
      .fadeIn()###