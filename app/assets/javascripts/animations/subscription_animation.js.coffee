class Animations.SubscriptionAnimation extends Animations.Animation
  animate: ->
    this._animateNet()
    this._animateBalls()

  _animateNet: ->
    line1Drawing = new Drawing(@snap, this._dottedLine(20, 20, 96, 84), '', 400)
    line2Drawing = new Drawing(@snap, this._dottedLine(96, 87, 250, 87), '', 400)
    line3Drawing = new Drawing(@snap, this._dottedLine(95, 86, 95, 170), '', 400)
    line4Drawing = new Drawing(@snap, this._dottedLine(96, 170, 185, 252), '', 400)
    line1Drawing.callOnFinished = ->
      line2Drawing.initDraw()
      line3Drawing.initDraw()
    line3Drawing.callOnFinished = ->
      line4Drawing.initDraw()
    line4Drawing.callOnFinished = =>
      $("#{@sectionSelector}-body").fadeIn()

    line1Drawing.initDraw()

  _animateBalls: ->
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .second-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(3)")
    this._animateBall("#{@sectionSelector} .second-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .single-column.first .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .second-column .little-ball:nth-child(3)")
    this._animateBall("#{@sectionSelector} .single-column.last .little-ball:nth-child(1)")
