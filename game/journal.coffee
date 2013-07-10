class @Journal
  @entries: []

  constructor: (@entries) ->
    for entry in @entries
      @write entry

  write: (content) ->
    @entries.unshift content
    $('#journal .content').prepend '<p>' + content + '</p>'

  getSerializable: () -> @entries
