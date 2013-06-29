$(document).ready ->

  # Inital setup (only once)

  $('#story').on 'click', (e) ->
    if (step >= getScene().script.length) then return
    $('#story').fadeOut('slow', -> $(this).html(renderLine(getScene().script[step++])).fadeIn())

  # Utilities

  renderLine = (script) ->
    '<span class="who ' + script.who + '">' + script.who + '</span>' + script.line
  # TODO: persist (to LocalStorage with crypting)

  # Load scene

  getScene = () ->
    {
      'id': 'some-slugified-name-to-remember'
      'background': 'orangered',
      #TODO: font color
      'script': [
        { who: 'me', line: "Lus?" },
        { who: 'Losoposki', line: "Luus."},
      ]
    }

  # Reset

  step = 1

  # Initialize the scene

  $('body').attr('style', 'background-color: ' + getScene().background)
  $('#story').html(renderLine(getScene().script[0]))
