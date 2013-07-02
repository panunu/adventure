class @Engine
  renderScript: (script) -> '<div class="who">' + script.who + '</div><blockquote>' + script.line + '</blockquote>'
  renderAction: (action) -> '<a href="#">' + action.label + '</a>'

  toggleLog: -> $('#toggle-log').click (e) -> $('#log').toggle()

  ###runScene: () ->
    step = 0
    $('#log .content').prepend renderScript(getScene().script[step])
    $('article').hide().delay(2000).fadeIn()
    $('#action').fadeOut()
    $('body').css('background-color', getScene().background)
    $('article').css('color', getScene().foreground)
    $('#story').html(renderScript(getScene().script[step]))
    $('#story').attr('class', getScene().script[step].who)
    $('#illustration .content').html('<i class="icon-' + getScene().icon + '"></i>')
    #storage.save scene, memory
    step++###

  # Inital setup (only once)
###
  $('#story').on 'click', (e) ->
    return if (step >= getScene().script.length)
    $('#story').fadeOut 'fast', ->
      $(this)
        .html(renderScript(getScene().script[step]))
        .attr('class', getScene().script[step].who)
        .fadeIn()

      $('#log .content').prepend renderScript(getScene().script[step])
      # memory.set 'log', $('#log .content')
      step++

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
###