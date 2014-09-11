//= require vendor/jquery.peity
//= require vendor/drawing.js

class Animation
  constructor: (@sectionSelector) ->
    @snap = Snap("#{@sectionSelector} .dots-net")

  _dottedLine: (x1, y1, x2, y2) ->
    attrs = {
      stroke: '#FF2B06', strokeDasharray: 3, strokeWidth: 0.7
    }
    @snap.path("M#{x1} #{y1} #{x2} #{y2}").attr(attrs).remove().toString()

class window.ConceptAnimation extends Animation
  animate: ->
    TweenMax.to(
      "#{@sectionSelector} .first-column .last-ball", 0.3, {
        opacity: 1, scale: 1.3,
        onComplete: =>
          this._animateNet()
          this._animateBalls()
      }
    )

  _animateNet: ->
    line1Drawing = new Drawing(@snap, this._dottedLine(0, 380, 60, 325), '', 800)
    line2Drawing = new Drawing(@snap, this._dottedLine(73, 320, 77, 130), '', 800)
    line3Drawing = new Drawing(@snap, this._dottedLine(75, 137, 145, 90), '', 800)
    line4Drawing = new Drawing(@snap, this._dottedLine(66, 325, 150, 268), '', 800)
    line5Drawing = new Drawing(@snap, this._dottedLine(158, 260, 230, 300), '', 800)
    line1Drawing.callOnFinished = ->
      line2Drawing.initDraw()
      line4Drawing.initDraw()
    line2Drawing.callOnFinished = ->
      line3Drawing.initDraw()
    line4Drawing.callOnFinished = ->
      line5Drawing.initDraw()
    line5Drawing.callOnFinished = =>
      $("#{@sectionSelector}-body").fadeIn()

    line1Drawing.initDraw()

  _animateBalls: ->
    ordering = Animations.Support.shuffle([1..4])
    small = ordering.slice(0, 2)
    big = ordering.slice(2, 4)

    for ballIndex, i in small
      TweenMax.to(
        "#{@sectionSelector} .little-ball:nth-child(#{ballIndex})",
        0.3,
        { opacity: 1, scale: 0.5 }
      ).delay(1*i)

      TweenMax.to(
        "#{@sectionSelector} .little-ball:nth-child(#{ballIndex})",
        0.3,
        { scale: 1 }
      ).delay(1.3*i)

    for ballIndex, i in big
      TweenMax.to(
        "#{@sectionSelector} .little-ball:nth-child(#{ballIndex})",
        0.3,
        { opacity: 1, scale: 1.5 }
      ).delay(1.3*i)

      TweenMax.to(
        "#{@sectionSelector} .little-ball:nth-child(#{ballIndex})",
        0.3,
        { scale: 1 }
      ).delay(1.8*i)

    TweenMax.to(
      "#{@sectionSelector} .last-column .little-ball", 0.3,
      { opacity: 1, rotation: -395 }
    ).delay(2)
