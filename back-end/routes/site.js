import express, { Router } from 'express';
import { verifyLogIn } from '../middlewares/auth.js';

const router = express.Router();

router.get('/', (req, res) => {
    // res.sendFile(__dirname + '/site/index.html')
    console.log('./site/index.html');
    res.sendFile('/Users/rikku/Documents/cinema/site/index.html')
})

router.get('/style.css', function(req, res) {
    res.sendFile("/Users/rikku/Documents/cinema/site/dist/output.css");
});

router.get('/home.js', function(req, res) {
    res.sendFile("/Users/rikku/Documents/cinema/site/script/home.js");
});

router.get('/script/search', function(req, res) {
    res.sendFile("/Users/rikku/Documents/cinema/site/script/search.js");
});

router.get('/search/:name', (req, res) => {
    res.sendFile('/Users/rikku/Documents/cinema/site/search.html')
})

router.get('/login', (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/login.html")
})
router.get('/impostazioni', verifyLogIn, (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/impostazioni.html")
})

router.get('/script/impostazioni', verifyLogIn, (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/script/impostazioni.js")
})

router.get('/login/css', (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/dist/output.css")
})
router.get('/login/js', (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/script/login.js")
})

router.get('/film/:name', (req, res) => {
    res.sendFile('/Users/rikku/Documents/cinema/site/film.html')
})

router.get('/script/film', (req, res) => {
    res.sendFile('/Users/rikku/Documents/cinema/site/script/film.js')
})

router.get('/img/:name', (req, res) => {
    const {name} = req.params
    res.sendFile(`/Users/rikku/Documents/cinema/back-end/public/img/locandine/${name}`)
})


export default router