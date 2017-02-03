$(document).ready(function() {
setTimeout(popup, 3000);
function popup() {
$("#logindiv").css("display", "block");
}
$("#login #cancel_pa").click(function() {
$(this).parent().parent().hide();
});
$("#onclick_pa").click(function() {
$("#contactdiv_pa").css("display", "block");
});
$("#contact_pa #cancel_pa").click(function() {
$(this).parent().parent().hide();
});
// Contact form popup send-button click event.
$("#send_pa").click(function() {
var name = $("#name_pa").val();
var email = $("#email").val();
var contact = $("#contactno").val();
var message = $("#message").val();
if (name == "" || email == "" || contactno == "" || message == ""){
alert("Please Fill All Fields");
}else{
if (validateEmail(email)) {
$("#contactdiv").css("display", "none");
}else {
alert('Invalid Email Address');
}
function validateEmail(email) {
var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
if (filter.test(email)) {
return true;
}else {
return false;
}
}
}
});
// Login form popup login-button click event.
$("#loginbtn").click(function() {
var name = $("#username").val();
var password = $("#password").val();
if (username == "" || password == ""){
alert("Username or Password was Wrong");
}else{
$("#logindiv").css("display", "none");
}
});
});