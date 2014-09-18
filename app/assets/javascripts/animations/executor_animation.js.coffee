class Animations.ExecutorAnimation extends Animations.Animation
  animate: ->
    this._animateNet()
    this._animateBalls()

  _animateNet: ->
    line1Drawing = new Drawing(@snap, this._dottedLine(405, 285, 320, 208), '', 400)
    line2Drawing = new Drawing(@snap, this._dottedLine(320, 200, 320, 120), '', 400)
    line3Drawing = new Drawing(@snap, this._dottedLine(320, 120, 220, 30), '', 400)
    line4Drawing = new Drawing(@snap, this._dottedLine(320, 130, 240, 200), '', 400)
    line5Drawing = new Drawing(@snap, this._dottedLine(240, 206, 40, 206), '', 400)
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
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(3)")
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(3)")
    this._animateBall("#{@sectionSelector} .single-column.last .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .single-column.middle .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .single-column.first .little-ball:nth-child(1)")
