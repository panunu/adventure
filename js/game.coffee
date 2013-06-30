$(document).ready ->

  # Inital setup (only once)

  $('#story').on 'click', (e) ->
    if (step >= getScene().script.length) then return
    $('#story').fadeOut 'fast', ->
      $(this)
        .html(renderLine(getScene().script[step]))
        .attr('class', getScene().script[step++].who)
        .fadeIn()

  # Utilities

  renderLine = (script) -> '<div class="who">' + script.who + '</div><blockquote>' + script.line + '</blockquote>'

  # TODO: persist (to LocalStorage with crypting/hashing)

  # Load scene

  getScene = () ->
    {
      'id': 'some-slugified-name-to-remember'
      'background': 'orangered',
      'foreground': 'white',
      'script': [
        { who: 'narrator', line: "You seem clueless." },
        { who: 'me', line: "How did I end up here?" },
        { who: 'Stranger', line: "You have always been here. You just have not noticed."},
        { who: 'me', line: "But I..."},
      ]
    }

  # Reset

  step = 0

  # Initialize the scene

  $('body').css('background-color', getScene().background)
  $('#story').css('color', getScene().foreground)
  $('#story').html(renderLine(getScene().script[step]))
  $('#story').attr('class', getScene().script[step].who)
  step++
