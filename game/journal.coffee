class @Journal
  @entries: []

  constructor: (@entries) ->
    for entry in @entries
      $('#journal .entries').prepend '<p>' + entry + '</p>'

  write: (entry) ->
    @entries.unshift entry
    $('#journal .entries').prepend '<p>' + entry + '</p>'

  getSerializable: () -> @entries
