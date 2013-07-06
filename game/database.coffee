class @Database

  load: ->
    {
      scene: $.jStorage.get 'scene',
      bag: $.jStorage.get 'bag'
      journal: $.jStorage.get 'journal'
    }

  save: (scene, bag, journal) ->
    $.jStorage.set 'saved', true
    $.jStorage.set 'scene', scene
    $.jStorage.set 'bag', bag
    $.jStorage.set 'journal', journal
    $.jStorage.set 'journal', journal

  hasSavedGame: -> if $.jStorage.get 'saved' then true else false