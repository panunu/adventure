class @Storage

  load: ->
    {
      scene: $.jStorage.get 'scene',
      memory: $.jStorage.get 'memory'
      journal: $.jStorage.get 'journal'
    }

  save: (scene, memory, journal) ->
    $.jStorage.set 'saved', true
    $.jStorage.set 'scene', scene
    $.jStorage.set 'memory', memory
    $.jStorage.set 'journal', journal

  hasSavedGame: -> if $.jStorage.get 'saved' then true else false