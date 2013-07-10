class @Journal
  @entries: []

  constructor: (@entries) ->
    for entry in @entries
      $('#journal .content').prepend '<p>' + entry + '</p>'

  write: (content) ->
    @entries.unshift content
    $('#journal .content').prepend '<p>' + content + '</p>'

  getSerializable: () -> @entries
