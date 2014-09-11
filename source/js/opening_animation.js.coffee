//= require vendor/snap.svg.js

class window.OpeningAnimation
  constructor: (@menuSelector) ->
    @snap = Snap("#{@menuSelector} .main-ball")
    @center = {
      x: 0,
      y: 0
    }
    @side = 50
    @radius = 50

  animate: ->
    this._drawSymbol()
    this._starAnimation()

  _drawSymbol: ->
    circle = @snap.circle(@center.x + @side, @center.y + @side, @radius)
    circle.attr({
      fill: 'white'
    })

    executorsRect = @snap.rect(@center.x, @center.y, @side, @side)
      .attr({
        fill: '#f9e5e4',
        stroke: '#f9e5e4'
      }).data({
        title: 'Realização',
      })
    tedxRect = @snap.rect(@center.x + @side, @center.y, @side, @side)
      .attr({
        fill: '#ff2b06',
        stroke: '#ff2b06'
      }).data({
        title: 'TEDxRecife 2014',
        step: 'concept-section'
      })
    contactRect = @snap.rect(@center.x, @center.y + @side, @side, @side)
      .attr({
        fill: '#f95e4e',
        stroke: '#f95e4e',
      }).data({
        title: 'Fale Conosco'
      })
    subscribeRect = @snap.rect(@center.x + @side, @center.y + @side, @side, @side)
      .attr({
        fill: '#9e2515',
        stroke: '#9e2515',
      }).data({
        title: 'Inscrições'
      })

    discs = @snap.group(tedxRect, subscribeRect, contactRect, executorsRect)
    discs.attr({
      mask: circle
    })
    discs.transform('r45')

    menuSelector = @menuSelector
    $.each discs.selectAll('rect'), ->
      this.hover ->
        $("#{menuSelector} .menu-hint").css('opacity', 0)

        hoveredItem = this
        $.each this.parent().selectAll('rect'), ->
          if this == hoveredItem
            this.attr({ opacity: 1 })
          else if !this.data('clicked')
            this.animate({ opacity: 0.5 }, 300)

        title = this.data('title')
        $("#{menuSelector} .menu-title").html(title).css(color: '#FF2B06')
      , ->
        menuItems = this.parent().selectAll('rect')
        clickedItems = (item for item in menuItems when item.data('clicked') == true)
        if clickedItems.length == 0
          $("#{menuSelector} .menu-title").css(color: 'transparent')
          $.each this.parent().selectAll('rect'), ->
            this.animate({ opacity: 1 }, 300)
        else
          item = clickedItems[0]
          title = item.data('title')
          $("#{menuSelector} .menu-title").html(title).css(color: '#FF2B06')
          unclickedItems = (item for item in menuItems when !item.data('clicked'))
          $.each unclickedItems, ->
            this.attr({ opacity: 0.5 })

    tedxRect.click (event) ->
      event.stopPropagation()

      impress().goto(this.data('step'), 2000)
      this.data(clicked: true)
      new ConceptAnimation('.concept').animate()

  _starAnimation: ->
    TweenMax.to(
      "#{@menuSelector} .main-ball", 3,
      { scale: 3, marginTop: '350px' }
    ).delay(3)

    TweenMax.fromTo(
      ".banner", 3,
      { opacity: 1, marginTop: '-300px' },
      {
        opacity: 0, marginTop: '-700px', scale: 0.3,
        onComplete: ->
         this.target.remove()
      }
    ).delay(3)

    TweenMax.to(
      "#{@menuSelector} .main-ball", 0.5, { scale: 1 }
    ).delay(6)

    TweenMax.to(
      "#{@menuSelector} .menu-hint", 0.5, { opacity: 1 }
    ).delay(7)

    TweenMax.to(
      "#{@menuSelector} .menu-hint", 0.5, { opacity: 0 }
    ).delay(9)
