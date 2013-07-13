class @Journal
  @entries: []

  constructor: (@entries) ->
    for entry in @entries
      $('#journal .entries').prepend '<p>' + entry + '</p>'

  write: (content) ->
    @entries.unshift content
    $('#journal .entries').prepend '<p>' + content + '</p>'

  getSerializable: () -> @entries
