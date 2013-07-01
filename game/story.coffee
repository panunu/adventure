# You can make editorial notes like this.
@act1_some_name = {
  'background': '#3F4037',
  'foreground': '#E3E5C7',
  'icon': 'road'

  'script': [
    { who: 'narrator', line: "You feel confused." },
    { who: 'me', line: "How did I end up here?" },
    { who: 'Stranger', line: "You have always been here. You just have not noticed."},
    { who: 'me', line: "But I..."},
    { who: 'narrator', line: "The stranger smiles."},
  ],

  'actions': [
    { goto: 'act1_other_scene', 'label': 'Continue walking' }
  ]
}

@act1_other_scene = {
  'background': '#111',
  'foreground': 'orangered',
  'icon': 'fire'

  'script': [
    { who: 'narrator', line: "The fire warms you." },
    { who: 'me', line: "What just happened?" },
    { who: 'me', line: "..." },
    { who: 'me', line: "Hello?" },
    { who: 'narrator', line: "All you hear is silence. You feel at unease." },
  ],

  'actions': [
    { goto: 'act1_some_name', 'label': 'Look up' }
  ]
}