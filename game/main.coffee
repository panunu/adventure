$(document).ready ->

  # Inital setup (only once)

  storage = new Storage
  memory  = new Memory
  log     = new Log
  engine  = new Engine

  # Initialize the scene

  scene = act1_intro
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
          scene = eval($(this).attr('data-goto'))
          next()

  $('#toggle-log').click (e) -> $('#log').toggle()

  # Functions

  next = ->
    step = 0
    engine.render(scene, step)
    log.add engine.renderScript(scene.script[step])
    #TODO: Save (storage.save scene, memory, log).
    step++

  next()

  # Lights, camera, action!
