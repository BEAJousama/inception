const express = require("express"),
    router = express.Router({ mergeParams: true }),
    passport = require("passport");
const nodemailer = require('nodemailer');

router.get("/", (req, res) => {
    res.render("accueil");
});

router.get("/portfolio", (req, res) => {
    res.render("portfolio");
});

router.post("/email", (req, res) => {

    let transporter = nodemailer.createTransport({
        host: 'smtp.zoho.com',
        port: 465,
        secure: true, //ssl
        auth: {
            user: 'b.blogg@zohomail.com',
            pass: 'B-Blog2021'
        }
    });

    let mailOptions = {
        from: 'b.blogg@zohomail.com',
        to: 'oussama.beaj2@gmail.com',
        subject: 'Email from Portfolio form',
        text: "Name : " + req.body.name + req.body.firstname + "\nEmail : " + req.body.email + "\nPhone : " + req.body.phone + "\nMessage : " + req.body.message
    };

    transporter.sendMail(mailOptions, function(error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });

    res.redirect("/portfolio");
});

router.get("*", (req, res) => {
    let d = new Date();
    res.send("Bad request \n " + d);

});

module.exports = router;