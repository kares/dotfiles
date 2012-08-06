(function() {
//
// web doctor - all facebook.com iframes must go :
var frames = document.getElementsByTagName('iframe');
for ( let i=0; i<frames.length; i++ ) {
    let frame = frames[i], src = frame.src;
    if ( src && src.match(/facebook\.com/) ) {
        frame.parentNode.removeChild(frame);
    }
}
//
})();