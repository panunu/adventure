$(document).ready ->

  # Inital setup (only once)

  database = new Database
  journal  = new Journal []
  bag      = new Bag {}

  # Initialize the scene

  scene = act1
  step  = 0

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
      database.save(scene, bag, journal)
      scene = (new Scene(scene, database, bag, journal)).start()
      step++
    else if scene != false
      scene = scene()

  # Lights, camera, action!

  if database.hasSavedGame()
    $('#loader').fadeIn()

    savegame = database.load()
    scene    = savegame.scene
    bag      = savegame.bag
    journal  = savegame.journal
    $('#loader').delay(2000).fadeOut(3000)

  play()
