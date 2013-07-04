# You can make editorial notes like this.
@act1_intro = {
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
    { goto: 'act1_fire', label: 'Continue walking' }
    { goto: 'act1_to_act2', label: 'Jump' }
  ]
}

@act1_fire = {
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
    { goto: 'act1_intro', label: 'Look up' }
  ]
}

@act1_to_act2 = {
  background: '#fff',
  foreground: 'black',
  icon: '',

  script: [
    { who: '', line: "Act 1" }
  ],

  actions: [
    { goto: 'act1_intro', label: 'Continue' }
  ]
}

@act1_dsl_example = ->
  @background 'black'
  @foreground 'white'
  @icon 'fire'

  @says 'Stranger', 'Lus', =>
    @background 'white'
    @foreground 'black'
    @icon 'fire'
    @say 'Would you answer a long question if I asked you? Just trying to write a long line to see how this works.', =>
      @says 'stranger', 'Yes.', =>
        console.log 'wryy'