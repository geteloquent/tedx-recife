class Animations.ExecutorAnimation extends Animations.Animation
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
    line1Drawing = new Drawing(@snap, this._dottedLine(425, 235, 320, 208), '', 800)
    line2Drawing = new Drawing(@snap, this._dottedLine(320, 200, 320, 120), '', 800)
    line3Drawing = new Drawing(@snap, this._dottedLine(320, 120, 220, 30), '', 800)
    line4Drawing = new Drawing(@snap, this._dottedLine(320, 130, 240, 200), '', 800)
    line5Drawing = new Drawing(@snap, this._dottedLine(240, 205, 40, 205), '', 800)
    line1Drawing.callOnFinished = ->
      line2Drawing.initDraw()
    line2Drawing.callOnFinished = ->
      line3Drawing.initDraw()
      line4Drawing.initDraw()
    line4Drawing.callOnFinished = ->
      line5Drawing.initDraw()
    line5Drawing.callOnFinished = =>
      $("#{@sectionSelector}-body").fadeIn()

    line1Drawing.initDraw()

  _animateBalls: ->
    ordering = Animations.Support.shuffle([1..9])
    small = ordering.slice(0, 3)
    medium = ordering.slice(3, 6)
    big = ordering.slice(6, 9)

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
      ).delay(1.5*i)

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

    for ballIndex, i in medium
      TweenMax.to(
        "#{@sectionSelector} .little-ball:nth-child(#{ballIndex})",
        0.3,
        { opacity: 1, scale: 1.3 }
      ).delay(1.2*i)

      TweenMax.to(
        "#{@sectionSelector} .little-ball:nth-child(#{ballIndex})",
        0.3,
        { scale: 1 }
      ).delay(1.7*i)
