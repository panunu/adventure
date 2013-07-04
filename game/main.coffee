$(document).ready ->

  # Inital setup (only once)

  storage = new Storage
  memory  = new Memory
  log     = new Log
  engine  = new Engine

  # Initialize the scene

  @scene = act1_dsl_example
  step  = 0

  # Bindings

  $('#story').on 'click', (e) -> next()

  $('#toggle-log').click (e) -> $('#log').toggle()

  # Functions

  next = =>
    if step == 0
      (@scene = new Scene(@scene)).start()
      @scene = @scene.play()
    else
      console.log @scene
      @scene = @scene()
    step++

  #TODO: Save (storage.save scene, memory, log).
  ###if engine.next(scene, step)
    log.add engine.renderScript(scene.script[step])
    step++
    action() if step == scene.script.length###

  ###action = ->
    engine.action(scene)

    $('#action a').on 'click', (e) ->
      e.preventDefault()
      scene = eval($(this).attr('data-goto'))
      step = 0
      next()###


  # Lights, camera, action!
  next()
