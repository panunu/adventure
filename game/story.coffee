# You can make editorial notes like this.

@act1 = ->
  @background '#222'
  @foreground 'white'
  @icon ''

  @normalize()

  @final @display 'Act 1', =>
    @bag.set 'lus', 'grande'
    @write 'My journey begins.'
    @button 'Start', 'act1_intro'

@act1_intro = ->
  @background '#3F4037'
  @foreground '#E3E5C7'
  @icon 'road'

  @write 'I do not remember how I ended up here. Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet.'

  @think 'I feel confused.', =>
    @say 'How did I end up here?', =>
      @says 'Stranger', 'You have always been here. You just have not noticed.', =>
        @say 'But I...', =>
          @final @think 'I can not find the right words.', =>
            @button 'Continue', 'act1_feelings'

@act1_feelings = ->
  @background '#330000'
  @foreground 'white'
  @icon 'eye'

  @shake()

  @loop 'sample.wav'

  @think 'What was that..?', =>
    @think 'This is not good. Not good at all.', =>
      @final @think 'Should I run? I might also be able to hide myself...', =>
        @button 'Hide', 'act1_hide'
        @button 'Run', 'act1'

@act1_hide = ->
  @background 'black'

  @normalize()
  @pulse()

  @says 'Creature', '* growls *', =>
    @think 'It is close...', =>
      @think 'I hope it goes away...', =>
        @says 'Creature', '* moves away *', =>
          @normalize()
          @final @think 'I think I made it.', =>
            @stop()
            @button 'Restart', 'act1'