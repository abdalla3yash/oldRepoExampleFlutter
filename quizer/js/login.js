var mail = document.getElementById("email");
var psw = document.getElementById("pass");


var passSpn = document.getElementById("ps");
var emailSpn = document.getElementById("em");

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
var email = getCookie("email");
var pass = getCookie("password");

function valid(e) {
    var mailVlu = mail.value;
    var passVlu = psw.value;
    if (mailVlu === "") {
        e.preventDefault();
        emailSpn.style.display = "inline";
        return false;
    } else if (passVlu === "") {
        e.preventDefault();
        passSpn.style.display = "inline";
        return false;
    } else if (email !== mailVlu) {
        e.preventDefault();
        emailSpn.textContent = "Wrong Email";
        emailSpn.style.display = "inline";
        passSpn.style.display = "none";
        return false;
    } else if (pass !== passVlu) {
        e.preventDefault();
        passSpn.textContent = "Wrong Password";
        passSpn.style.display = "inline";
        emailSpn.style.display = "none";
        return false;
    } else {
        passSpn.style.display = "none";
        emailSpn.style.display = "none";
        location.replace("exam.html");
        return true;
    }


}