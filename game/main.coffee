$(document).ready ->

  # Inital setup (only once)

  storage = new Storage
  memory  = new Memory
  log     = new Log
  engine  = new Engine

  # Initialize the scene

  scene = act1_some_name
  step  = 0

  initialize = ->
    step = 0
    log.add engine.renderScript(scene.script[step])
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut()
    $('body').css('background-color', scene.background)
    $('article').css('color', scene.foreground)
    $('#story').html engine.renderScript(scene.script[step])
    $('#story').attr('class', scene.script[step].who)
    $('#illustration .content').html('<i class="icon-' + scene.icon + '"></i>')
    #storage.save scene, memory
    step++


  $('#story').on 'click', (e) ->
    return if (step >= scene.script.length)
    $('#story').fadeOut 'fast', ->
      $(this)
        .html(engine.renderScript(scene.script[step]))
        .attr('class', scene.script[step].who)
        .fadeIn()

      log.add(engine.renderScript(scene.script[step]))
      # memory.set 'log', $('#log .content')
      step++

      if step == scene.script.length
        $('#action')
          .hide()
          .html(engine.renderAction(scene.actions[0]))
          .delay(1500)
          .fadeIn()

        $('#story').addClass('last')

        $('#action a').on 'click', (e) ->
          e.preventDefault()
          scene = eval(scene.actions[0].goto)
          initialize()

  # Lights, camera, action!

  ###if storage.hasSavedGame()
    savegame = storage.load()
    scene = savegame.scene

    if savegame.memory instanceof Memory
      memory = savegame.memory
      $('#log .content').prepend(savegame.memory.get 'log')###

  initialize()