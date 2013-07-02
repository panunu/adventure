class @Log
  constructor: () ->
    $('#toggle-log').click (e) -> $('#log').toggle()

  add: (content) -> $('#log .content').prepend content