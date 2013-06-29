$(document).ready ->

  # Inital setup (only once)

  $('#story').on 'click', (e) ->
    if (step >= getScene().script.length) then return
    $('#story').fadeOut('slow', -> $(story).html(getScene().script[step++]).fadeIn())

  # Load scene

  getScene = () ->
    {
      'id': 'some-slugified-name-to-remember'
      'background': 'orangered',
      'script': [
        'kvaak',
        'wraa',
      ]
    }

  # Reset

  step = 1

  # Initialize the scene

  $('body').attr('style', 'background-color: ' + getScene().background)
  $('#story').html(getScene().script[0])
