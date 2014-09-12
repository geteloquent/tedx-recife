//= require vendor/jquery.peity
//= require vendor/drawing.js

class Animations.Animation
  constructor: (@sectionSelector) ->
    @snap = Snap("#{@sectionSelector} .dots-net")

  _dottedLine: (x1, y1, x2, y2) ->
    attrs = {
      stroke: '#FF2B06', strokeDasharray: 3, strokeWidth: 0.7
    }
    @snap.path("M#{x1} #{y1} #{x2} #{y2}").attr(attrs).remove().toString()

