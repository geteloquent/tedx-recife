function Drawing( s, svgString, transformString, timeBetweenDraws ) {
    this.fragment = Snap.parse( svgString );
    this.pathArray = this.fragment.selectAll('path');
    this.group = s.g().transform( transformString ).drag();
    this.timeBetweenDraws = timeBetweenDraws;
};

Drawing.prototype.init = function( svgString, transformString ) {
      this.group.clear();
      this.currentPathIndex = 0;

};

Drawing.prototype.endReached = function() {
    if( this.currentPathIndex >= this.pathArray.length ) {
        return true;
    };
};

Drawing.prototype.callOnFinished = function() {
}

Drawing.prototype.initDraw = function() {
    this.init();
    this.draw();
};

Drawing.prototype.quickDraw = function() {
    this.init();
    this.timeBetweenDraws = 0;
    this.draw();
};


Drawing.prototype.draw = function() {         // this is the main animation bit
    if( this.endReached() ) {
        var myPath = this.pathArray[ this.currentPathIndex - 1] ;
        myPath.attr({
          "stroke-dasharray": "3px",
        });

        if( this.callOnFinished ) {
            this.callOnFinished();
            return
        };
    };
    var myPath = this.pathArray[ this.currentPathIndex ] ;

    this.leng = myPath.getTotalLength();

    this.group.append( myPath );

     myPath.attr({
       fill: 'none',
       "stroke-dasharray": this.leng + " " + this.leng,
       "stroke-dashoffset": this.leng
     });

     this.currentPathIndex++;

     myPath.animate({"stroke-dashoffset": 0}, this.timeBetweenDraws, mina.easeout, this.draw.bind( this ) );

}
