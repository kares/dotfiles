(function() {
//
var ads = document.getElementsByClassName('LastAd');
for ( var i=0; i<ads.length; i++ ) {
    var elem = ads[ i ];
    if ( ! elem.style ) continue;
    elem.style.display = "none";
}
//
})();