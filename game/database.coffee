class @Database

  load: ->
    {
      scene:   $.jStorage.get 'scene'
      bag:     new Bag(@unserialize($.jStorage.get 'bag'))
      journal: new Journal(@unserialize($.jStorage.get 'journal'))
    }

  save: (scene, bag, journal) ->
    $.jStorage.set 'saved',   true
    $.jStorage.set 'date',    new Date()
    $.jStorage.set 'scene',   scene
    $.jStorage.set 'bag',     @serialize(bag)
    $.jStorage.set 'journal', @serialize(journal)

  hasSavedGame: -> if $.jStorage.get 'saved' then true else false

  serialize: (item) -> JSON.stringify(item.getSerializable(), null, 2)
  unserialize: (item) -> JSON.parse(item)