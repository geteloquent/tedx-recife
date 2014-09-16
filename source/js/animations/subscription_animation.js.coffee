class Animations.SubscriptionAnimation extends Animations.Animation
  animate: ->
    TweenMax.to(
      "#{@sectionSelector} .first-column .first-ball", 0.3, {
        opacity: 1, scale: 1.3,
        onComplete: =>
          this._animateNet()
          this._animateBalls()
      }
    )
    TweenMax.to(
      "#{@sectionSelector} .first-column .first-ball .peity", 0.3, {
        rotation: 90
      }
    )

  _animateNet: ->
    line1Drawing = new Drawing(@snap, this._dottedLine(20, 20, 96, 88), '', 800)
    line2Drawing = new Drawing(@snap, this._dottedLine(96, 86, 250, 86), '', 800)
    line3Drawing = new Drawing(@snap, this._dottedLine(96, 86, 96, 170), '', 800)
    line4Drawing = new Drawing(@snap, this._dottedLine(96, 170, 185, 252), '', 800)
    line1Drawing.callOnFinished = ->
      line2Drawing.initDraw()
      line3Drawing.initDraw()
    line3Drawing.callOnFinished = ->
      line4Drawing.initDraw()
    line4Drawing.callOnFinished = =>
      $("#{@sectionSelector}-body").fadeIn()

    line1Drawing.initDraw()

  _animateBalls: ->
    ordering = Animations.Support.shuffle([1..8])
    small = ordering.slice(0, 4)
    big = ordering.slice(4, 8)

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
      "#{@sectionSelector} .first-column .middle-ball .peity", 0.3,
      { opacity: 1, rotation: 143 }
    ).delay(1.3)

    TweenMax.to(
      "#{@sectionSelector} .second-column .first-ball .peity", 0.3,
      { opacity: 1, rotation: 90 }
    ).delay(1.1)

    TweenMax.to(
      "#{@sectionSelector} .second-column .last-ball .peity", 0.3,
      { opacity: 1, rotation: 45 }
    ).delay(1.1)
