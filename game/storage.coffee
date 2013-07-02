class @Storage

  load: ->
    {
      'scene': $.jStorage.get 'scene',
      'memory': $.jStorage.get 'memory'
    }

  save: (scene, memory) ->
    $.jStorage.set 'saved', true
    $.jStorage.set 'scene', scene
    $.jStorage.set 'memory', memory

  hasSavedGame: -> if $.jStorage.get 'saved' then true else false