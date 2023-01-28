const express = require('express'),
    app = express(),
    bodyParser = require("body-parser"),
    flash = require("connect-flash"),
    passport = require("passport"),
    methodOverride = require("method-override"),
    RouterIndex = require("./routes/index");


app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "ejs");
app.use(express.static(__dirname + "/public"));



app.use(require("express-session")({
    secret: "hi beaj welcome",
    resave: false,
    saveUninitialized: false
}));
app.use(flash());
app.use(function(req, res, next) {
    res.locals.currentuser = req.user;
    res.locals.error = req.flash("error");
    res.locals.success = req.flash("success");
    next();
});
app.use(methodOverride("_method"));


app.use("/", RouterIndex);

app.listen(process.env.PORT || 3000, function() {
    console.log("server has been started");
});