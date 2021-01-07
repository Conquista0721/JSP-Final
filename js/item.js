


    ScoreBl = true;
    
    scoreI = null;
    
    scoreImgs = [];
    
    
    
    function scoreFunc(event) {
    
    if (ScoreBl) {
    
    scoreImgs = document.getElementsByClassName('scoreImg');
    
    }
    
    var e = event || window.event;
    
    var target = e.target || e.srcElement;
    
    var x = target.getAttribute('data-index');
    
    
    
    var nowI = parseInt(x, 10);
    
    var i;
    
    if (nowI != scoreI) {
    
    scoreI = nowI;
    
    for (i = 0, len = scoreImgs.length; i < len; i++) {
    
    scoreImgs[i].src = "img/star.png";
    
    }
    
    for (i = 0; i < nowI; i++) {
    
    scoreImgs[i].src = "img/light.png";
    
    }
    
    } else {
    
    scoreI = 0;
    
    for (i = 0, len = scoreImgs.length; i < len; i++) {
    
    scoreImgs[i].src = "img/star.png";
    
    }
    
    }
    
    }
    