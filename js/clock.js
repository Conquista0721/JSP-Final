var clockid=new Array()
var clockidoutside=new Array()
var i_clock=-1
var thistime= new Date()
var hours=thistime.getHours()
var minutes=thistime.getMinutes()
var seconds=thistime.getSeconds()
if (eval(hours) <10) {hours="0"+hours}
if (eval(minutes) < 10) {minutes="0"+minutes}
if (seconds < 10) {seconds="0"+seconds}
var thistime = hours+":"+minutes+":"+seconds
    
function writeclock() {
    i_clock++
    if (document.all || document.getElementById || document.layers) {
        clockid[i_clock]="clock"+i_clock
        document.write("<span id='"+clockid[i_clock]+"' style='position:relative'>"+thistime+"</span>")
    }
}

function clockon() {
    thistime= new Date()
    hours=thistime.getHours()
    minutes=thistime.getMinutes()
    seconds=thistime.getSeconds()
    if (eval(hours) <10) {hours="0"+hours}
    if (eval(minutes) < 10) {minutes="0"+minutes}
    if (seconds < 10) {seconds="0"+seconds}
    thistime = hours+":"+minutes+":"+seconds
        
    if (document.all) {
        for (i=0;i<=clockid.length-1;i++) {
            var thisclock=eval(clockid[i])
            thisclock.innerHTML=thistime
        }
    }
    
    if (document.getElementById) {
        for (i=0;i<=clockid.length-1;i++) {
            document.getElementById(clockid[i]).innerHTML=thistime
        }
    }
    var timer=setTimeout("clockon()",1000)
}
window.onload=clockon


　　　　 var num_jia = document.getElementById("num-jia");
var num_jian = document.getElementById("num-jian");
var input_num = document.getElementById("input-num");

num_jia.onclick = function() {

input_num.value = parseInt(input_num.value) + 1;
}

num_jian.onclick = function() {

if(input_num.value <= 0) {
  input_num.value = 0;
} else {

  input_num.value = parseInt(input_num.value) - 1;
}

}

window.onload = function () {
var s = document.getElementById("pingStar"),
m = document.getElementById('dir'),
n = s.getElementsByTagName("li"),
input = document.getElementById('startP'); 
clearAll = function () {
for (var i = 0; i < n.length; i++) {
n[i].className = '';
}
}
for (var i = 0; i < n.length; i++) {
n[i].onclick = function () {
var q = this.getAttribute("rel");
clearAll();
input.value = q;
for (var i = 0; i < q; i++) {
n[i].className = 'on';
}
m.innerHTML = this.getAttribute("title");
}
n[i].onmouseover = function () {
var q = this.getAttribute("rel");
clearAll();
for (var i = 0; i < q; i++) {
n[i].className = 'on';
}
}
n[i].onmouseout = function () {
clearAll();
for (var i = 0; i < input.value; i++) {
n[i].className = 'on';
}
}
}
}