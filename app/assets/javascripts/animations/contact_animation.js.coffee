class Animations.ContactAnimation extends Animations.Animation
  animate: ->
    this._animateNet()
    this._animateBalls()

  _animateNet: ->
    line1Drawing = new Drawing(@snap, this._dottedLine(397, 10, 310, 82), '', 400)
    line2Drawing = new Drawing(@snap, this._dottedLine(312, 80, 220, 80), '', 400)
    line3Drawing = new Drawing(@snap, this._dottedLine(220, 80, 20, 80), '', 400)
    line4Drawing = new Drawing(@snap, this._dottedLine(220, 80, 220, 240), '', 400)
    line1Drawing.callOnFinished = ->
      line2Drawing.initDraw()
    line2Drawing.callOnFinished = ->
      line3Drawing.initDraw()
      line4Drawing.initDraw()
    line4Drawing.callOnFinished = =>
      $("#{@sectionSelector}-body").fadeIn()

    line1Drawing.initDraw()

  _animateBalls: ->
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .single-column.last .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(3)")
    this._animateBall("#{@sectionSelector} .single-column.middle .little-ball:nth-child(1)")
