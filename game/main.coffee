$(document).ready ->

  # Inital setup (only once)

  database = new Database
  journal  = new Journal []
  bag      = new Bag {}

  # Initialize the scene

  scene = 'act1'
  step  = 0

  # Bindings

  $('#story').on 'click', (e) ->
    play()

  $('#toggle-journal').click (e) ->
    e.preventDefault()
    $('#journal').toggle()

  $('#journal .close').click (e) ->
    e.preventDefault()
    $('#journal').hide()

  $('#action').on 'click', 'a', (e) ->
    e.preventDefault()
    scene = $(this).attr('data-goto')
    step = 0
    play()

  # Functions

  play = =>
    if step is 0
      database.save(scene, bag, journal)
      console.log scene
      scene = (new Scene(eval(scene), database, bag, journal)).start()
      step++
    else if scene != false
      scene = scene()

  # Lights, camera, action!

  if not database.hasSavedGame()
    $('#loader').hide()
  else
    savegame = database.load()
    scene    = savegame.scene
    bag      = savegame.bag
    journal  = savegame.journal
    $('#loader').delay(2000).fadeOut(1000)

  $('body').addClass 'initialized'

  play()
