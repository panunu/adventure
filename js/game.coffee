$(document).ready ->

  # Inital setup (only once)

  $('#story').on 'click', (e) ->
    if (step >= getScene().script.length) then return
    $('#story').fadeOut 'fast', ->
      $(this)
        .html(renderScript(getScene().script[step]))
        .attr('class', getScene().script[step++].who)
        .fadeIn()

      if step == getScene().script.length
        $('#action')
          .hide()
          .html(renderAction(getScene().actions[0]))
          .delay(1000)
          .fadeIn()

  # Utilities

  renderScript = (script) -> '<div class="who">' + script.who + '</div><blockquote>' + script.line + '</blockquote>'
  renderAction = (action) -> '<a href="#">' + action.action + '</a>'

  # TODO: persist (to LocalStorage with crypting/hashing)

  # Load scene

  getScene = () -> act1_some_name

  # Reset

  step = 0

  # Initialize the scene

  $('body').css('background-color', getScene().background)
  $('article').css('color', getScene().foreground)
  $('#story').html(renderScript(getScene().script[step]))
  $('#story').attr('class', getScene().script[step].who)
  $('#illustration .content').html('<i class="icon-' + getScene().icon + '"></i>')
  step++
