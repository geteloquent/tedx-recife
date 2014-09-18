//= require jquery.peity
//= require drawing.js

class Animations.Animation
  constructor: (@sectionSelector) ->
    @snap = Snap("#{@sectionSelector} .dots-net")
    @scheduledBallCount = 0

  _dottedLine: (x1, y1, x2, y2) ->
    attrs = {
      stroke: '#FF2B06', strokeDasharray: 3, strokeWidth: 0.7
    }
    @snap.path("M#{x1} #{y1} #{x2} #{y2}").attr(attrs).remove().toString()

  _animateBall: (selector, i) ->
    @scheduledBallCount++
    setTimeout(->
      $(selector).addClass('animation-target')
      TweenMax.to(selector, 0.3, { opacity: 1 })
    , 500 + @scheduledBallCount * 100)

