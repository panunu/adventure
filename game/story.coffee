# You can make editorial notes like this.

@act1 = ->
  @background 'black'
  @foreground 'white'
  @icon ''

  @last (@display 'Act 1', =>), =>
    @button 'Start', 'act1_intro'

@act1_intro = ->
  @background '#3F4037'
  @foreground '#E3E5C7'
  @icon 'road'

  @think 'I feel confused.', =>
    @say 'How did I end up here?', =>
      @says 'Stranger', 'You have always been here. You just have not noticed.', =>
        @say 'But I...', =>
          @last (@think 'I can not find the right words.', =>), =>
            @button 'Continue', 'act1'