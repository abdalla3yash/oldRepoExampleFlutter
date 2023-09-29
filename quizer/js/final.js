function getCookie(key) {
    var res = "not found";
    var data = document.cookie;
    var arr = data.split("; ");
    arr.forEach(function(el) {
        var keyAndValue = el.split("=");
        if (keyAndValue[0] === key) {
            res = keyAndValue[1];
        }

    })
    return res;
}

var fName = getCookie("fname");
var lname = getCookie("lname");
var user_grade = sessionStorage.getItem("grade");

document.querySelector("div.name").innerHTML = " THANKS " + "<span>" + fName + " " + lname + "</span>";
document.querySelector("div.grd").innerHTML = "Your Grade Is " + "<span>" + user_grade + " /10" + "</span>";