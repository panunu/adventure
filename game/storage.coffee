class Storage

  load: ->
    return {
      'stage': $.jStorage.get 'stage',
      'memory': $.jStorage.get 'memory'
    }

  save: (stage, memory) ->
    $.jStorage.set 'saved', true
    $.jStorage.set 'stage', stage
    $.jStorage.set 'memory', memory

  hasSavedGame: ->
    if $.jStorage.get 'saved' then true else false