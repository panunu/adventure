class @Database

  load: ->
    {
      scene:   eval('scene = ' + $.jStorage.get 'scene')
      bag:     new Bag(@unserialize($.jStorage.get 'bag'))
      journal: $.jStorage.get 'journal'
    }

  save: (scene, bag, journal) ->
    $.jStorage.set 'saved', true
    $.jStorage.set 'scene', '' + scene
    $.jStorage.set 'bag', @serialize(bag)
    # TODO: Journal.

  hasSavedGame: -> if $.jStorage.get 'saved' then true else false

  serialize: (item) -> JSON.stringify(item.getSerializable(), null, 2)
  unserialize: (item) -> JSON.parse(item)