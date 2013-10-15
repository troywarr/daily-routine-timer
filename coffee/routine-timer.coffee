#
class window.RoutineTimer

  #
  constructor: ->
    @$stopwatch = $ '#example-7'

  #
  create: ->
    @stopwatch = new window.Stopwatch
      targetTime: 3000
      atTarget: =>
        @stopwatch.disable()
        @$stopwatch.addClass 'completed'
    , (time) =>
      percentageStr = "#{Math.floor time.progress * 100}%"
      @$stopwatch.find('.inner.bar').css 'width', percentageStr # set bar width
      @$stopwatch.find('.percentage').text percentageStr # text output

  #
  initButtons: ->
    @$stopwatch.find('.start').click =>
      @stopwatch.start()
    @$stopwatch.find('.stop').click =>
      @stopwatch.stop()
    @$stopwatch.find('.reset').click =>
      @stopwatch.enable()
      @$stopwatch.removeClass 'completed'
      @stopwatch.reset()

  #
  init: ->
    @create()
    @initButtons()