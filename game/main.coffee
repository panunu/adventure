$(document).ready ->

  # Inital setup (only once)

  storage = new Storage
  memory  = new Memory
  log     = new Log
  engine  = new Engine

  # Initialize the scene

  scene = act1_some_name
  step  = 0

  # Bindings

  $('#story').on 'click', (e) ->
    if engine.step(scene, step)
      log.add engine.renderScript(scene.script[step])
      step++

      if step == scene.script.length
        engine.action(scene)

        $('#action a').on 'click', (e) ->
          e.preventDefault()
          scene = eval(scene.actions[0].goto)
          next()

  $('#toggle-log').click (e) -> $('#log').toggle()

  # Functions

  next = ->
    step = 0
    engine.render(scene, step)
    log.add engine.renderScript(scene.script[step])
    #storage.save scene, memory, log
    step++

  ###if storage.hasSavedGame()
    savegame = storage.load()
    scene = savegame.scene

    if savegame.memory instanceof Memory
      memory = savegame.memory
      $('#log .content').prepend(savegame.memory.get 'log')###

  next()

  # Lights, camera, action!
