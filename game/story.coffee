# You can make editorial notes like this.
@act1_some_name = {
  background: '#3F4037',
  foreground: '#E3E5C7',
  icon: 'road',

  script: [
    { who: 'thought', line: "I feel confused." },
    { who: 'me', line: "How did I end up here?" },
    { who: 'Stranger', line: "You have always been here. You just have not noticed."},
    { who: 'me', line: "But I..."},
    { who: 'thought', line: "I can not find the right words."},
  ],

  actions: [
    { goto: 'act1_other_scene', label: 'Continue walking' }
  ]
}

@act1_other_scene = {
  background: '#111',
  foreground: 'orangered',
  icon: 'fire',

  script: [
    { who: 'thought', line: "The fire feels warm." },
    { who: 'me', line: "What just happened?" },
    { who: 'me', line: "..." },
    { who: 'me', line: "Hello?" },
    { who: 'thought', line: "I must be alone." },
  ],

  actions: [
    { goto: 'act1_some_name', label: 'Look up' }
  ]
}