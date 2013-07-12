# You can make editorial notes like this.

@act1 = ->
  @background 'black'
  @foreground 'white'
  @icon ''

  @final @display 'Act 1', =>
    @write 'My journey begins.'
    @bag.set 'lus', 'grande'
    @button 'Start', 'act1_intro'

@act1_intro = ->
  @background '#3F4037'
  @foreground '#E3E5C7'
  @icon 'road'

  @think 'I feel confused.', =>
    @say 'How did I end up here?', =>
      @says 'Stranger', 'You have always been here. You just have not noticed.', =>
        @say 'But I...', =>
          @final @think 'I can not find the right words.', =>
            @button 'Continue', 'act1_feelings'

@act1_feelings = ->
  @background '#550000'
  @foreground 'white'
  @icon 'eye'

  @panic()

  @think 'What was that..?', =>
    @think 'This is not good. Not good at all.', =>
      @final @think 'Should I run? I might also be able to hide myself...', =>
        @button 'Hide', 'act1_hide'

@act1_hide = ->
  @background 'black'

  @normalize()

  @says 'Creature', '* growls *', =>
