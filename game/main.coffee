$(document).ready ->

  # Inital setup (only once)

  storage = new Storage
  memory  = new Memory
  log     = new Log

  # Initialize the scene

  scene = act1_dsl_example
  step = 0

  # Bindings

  $('#story').on 'click', (e) ->
    play()

  $('#toggle-log').click (e) ->
    e.preventDefault()
    $('#log').toggle()

  $('#action').on 'click', 'a', (e) ->
    e.preventDefault()
    scene = eval($(this).attr('data-goto'))
    step = 0
    play()

  # Functions

  play = =>
    if step == 0
      scene = (new Scene(scene)).start()
      step++
    else if scene != false
      scene = scene()

    #TODO: Save (storage.save scene, memory, log).
    #TODO: Log.

  # Lights, camera, action!

  play()
