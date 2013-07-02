class @Storage

  load: ->
    {
      'scene': $.jStorage.get 'scene',
      'memory': $.jStorage.get 'memory'
      'log': $.jStorage.get 'log'
    }

  save: (scene, memory, log) ->
    $.jStorage.set 'saved', true
    $.jStorage.set 'scene', scene
    $.jStorage.set 'memory', memory
    $.jStorage.set 'log', log

  hasSavedGame: -> if $.jStorage.get 'saved' then true else false