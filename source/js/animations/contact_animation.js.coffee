class Animations.ContactAnimation extends Animations.Animation
  animate: ->
    TweenMax.to(
      "#{@sectionSelector} .first-column .first-ball", 0.3, {
        opacity: 1, scale: 1.3,
        onComplete: =>
          this._animateNet()
          this._animateBalls()
      }
    )

  _animateNet: ->
    line1Drawing = new Drawing(@snap, this._dottedLine(397, 10, 310, 82), '', 800)
    line2Drawing = new Drawing(@snap, this._dottedLine(312, 80, 220, 80), '', 800)
    line3Drawing = new Drawing(@snap, this._dottedLine(220, 80, 20, 80), '', 800)
    line4Drawing = new Drawing(@snap, this._dottedLine(220, 80, 220, 240), '', 800)
    line1Drawing.callOnFinished = ->
      line2Drawing.initDraw()
    line2Drawing.callOnFinished = ->
      line3Drawing.initDraw()
      line4Drawing.initDraw()
    line4Drawing.callOnFinished = =>
      $("#{@sectionSelector}-body").fadeIn()

    line1Drawing.initDraw()

  _animateBalls: ->
    ordering = Animations.Support.shuffle([1..7])
    small = ordering.slice(0, 3)
    big = ordering.slice(3, 7)

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
      ).delay(1.5*i)

    TweenMax.to(
      "#{@sectionSelector} .single-column .last-ball .peity", 0.3,
      { opacity: 1, rotation: 90 }
    ).delay(1.3)

    TweenMax.to(
      "#{@sectionSelector} .middle-column .last-ball .peity", 0.3,
      { opacity: 1, rotation: 142 }
    ).delay(2)
