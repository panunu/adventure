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

  $('#story').on 'click', (e) -> next()

  $('#toggle-log').click (e) -> $('#log').toggle()

  # Functions

  action = ->
    engine.action(scene)

    $('#action a').on 'click', (e) ->
      e.preventDefault()
      scene = eval($(this).attr('data-goto'))
      step = 0
      next()

  next = ->
    if step == 0
      engine.render(scene, step)
      #TODO: Save (storage.save scene, memory, log).

    if engine.step(scene, step)
      log.add engine.renderScript(scene.script[step])
      step++
      action() if step == scene.script.length

  engine.render(scene, step)
  next()

  # Lights, camera, action!
