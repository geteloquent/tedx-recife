class Animations.ConceptAnimation extends Animations.Animation
  animate: ->
    this._animateNet()
    this._animateBalls()

  _animateNet: ->
    line1Drawing = new Drawing(@snap, this._dottedLine(0, 380, 60, 325), '', 400)
    line2Drawing = new Drawing(@snap, this._dottedLine(75, 320, 75, 130), '', 400)
    line3Drawing = new Drawing(@snap, this._dottedLine(75, 137, 145, 90), '', 400)
    line4Drawing = new Drawing(@snap, this._dottedLine(64, 320, 165, 240), '', 400)
    line5Drawing = new Drawing(@snap, this._dottedLine(165, 240, 256, 318), '', 400)
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
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(3)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(3)")
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .first-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(4)")
    this._animateBall("#{@sectionSelector} .last-column .little-ball:nth-child(1)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(2)")
    this._animateBall("#{@sectionSelector} .middle-column .little-ball:nth-child(1)")
