class @Database

  load: ->
    {
      scene: $.jStorage.get 'scene',
      bag: $.jStorage.get 'bag'
      journal: $.jStorage.get 'journal'
    }

  save: (scene, bag, journal) ->
    $.jStorage.set 'saved', true
    $.jStorage.set 'scene', @serialize(scene)

    # TODO: Serialize.
    #$.jStorage.set 'bag', @serialize(bag)
    #$.jStorage.set 'journal', @serialize(journal)

  hasSavedGame: -> if $.jStorage.get 'saved' then true else false

  serialize: (item) -> '' + item