$(document).ready ->

  # Reset

  step = 0
  scene = act1_some_name

  # Utilities

  renderScript = (script) -> '<div class="who">' + script.who + '</div><blockquote>' + script.line + '</blockquote>'
  renderAction = (action) -> '<a href="#">' + action.label + '</a>'
  getScene = () -> scene

  # TODO: persist (to LocalStorage with crypting/hashing)

  # Initialize the scene

  initialize = ->
    step = 0
    $('#log .content').prepend renderScript(getScene().script[step])
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut()
    $('body').css('background-color', getScene().background)
    $('article').css('color', getScene().foreground)
    $('#story').html(renderScript(getScene().script[step]))
    $('#story').attr('class', getScene().script[step].who)
    $('#illustration .content').html('<i class="icon-' + getScene().icon + '"></i>')
    step++

  # Inital setup (only once)

  $('#toggle-log').click (e) -> $('#log').toggle()

  $('#story').on 'click', (e) ->
    return if (step >= getScene().script.length)
    $('#story').fadeOut 'fast', ->
      $(this)
        .html(renderScript(getScene().script[step]))
        .attr('class', getScene().script[step].who)
        .fadeIn()

      $('#log .content').prepend renderScript(getScene().script[step])
      step++
      #memory.add 'log' getScene().script[step - 1]

      if step == getScene().script.length
        $('#action')
          .hide()
          .html(renderAction(getScene().actions[0]))
          .delay(1500)
          .fadeIn()

        $('#story').addClass('last')

        $('#action a').on 'click', (e) ->
          e.preventDefault()
          scene = eval(getScene().actions[0].goto)
          initialize()

  # Lights, camera, action!

  initialize()