$(document).ready ->

  # Inital setup (only once)

  storage = new Storage
  memory  = new Memory
  journal = new Journal

  # Initialize the scene

  scene = act1
  step = 0

  # Bindings

  $('#story').on 'click', (e) ->
    play()

  $('#toggle-journal').click (e) ->
    e.preventDefault()
    $('#journal').toggle()

  $('#action').on 'click', 'a', (e) ->
    e.preventDefault()
    scene = eval($(this).attr('data-goto'))
    step = 0
    play()

  # Functions

  play = =>
    if step is 0
      #storage.save(scene, memory, log)
      scene = (new Scene(scene, storage, memory, journal)).start()
      step++
    else if scene != false
      scene = scene()

  # Lights, camera, action!

  if false #storage.hasSavedGame()
    savegame = storage.load()
    scene = savegame.scene
    memory = savegame.memory
    journal = savegame.journal

  play()
