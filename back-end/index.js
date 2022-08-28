import express from 'express';
import mysql from 'mysql';
import cors from 'cors'
import cookieParser from 'cookie-parser';
import path from 'path';
import { fileURLToPath } from 'url';
import fetch from 'node-fetch'

import userRoutes from './routes/users.js'
import programmazioneRoutes from './routes/programmazione.js'
import authRoutes from './routes/auth.js'
import filmRoutes from './routes/film.js'

const app = express();
const PORT = 3000;
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.use(express.json()) // attenzione, i middleware vanno prima dei routes
app.use(express.urlencoded({extended:true}))
app.use(cors())
app.use(cookieParser())

app.use('/users', userRoutes); 
app.use('/programmazione', programmazioneRoutes); 
app.use('/auth', authRoutes); 
app.use('/api/film', filmRoutes);

const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'root',
    database : 'cinema',
    port     : 8889,
    multipleStatements: true
});

connection.connect((err) => {
    if(err){
        console.error("errore");
        return;
    }

    console.log("DB: connected");
})

app.get('/', (req, res) => {
    // res.sendFile(__dirname + '/site/index.html')
    console.log('./site/index.html');
    res.sendFile('/Users/rikku/Documents/cinema/site/index.html')
})

app.get('/style.css', function(req, res) {
    res.sendFile("/Users/rikku/Documents/cinema/site/dist/output.css");
});

app.get('/home.js', function(req, res) {
    res.sendFile("/Users/rikku/Documents/cinema/site/script/home.js");
});

app.get('/login', (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/login.html")
})
app.get('/login/css', (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/dist/output.css")
})
app.get('/login/js', (req, res) => {
    res.sendFile("/Users/rikku/Documents/cinema/site/script/login.js")
})

app.get('/film/:name', (req, res) => {
    res.sendFile('/Users/rikku/Documents/cinema/site/film.html')
})

app.get('/script/film', (req, res) => {
    res.sendFile('/Users/rikku/Documents/cinema/site/script/film.js')
})

app.get('/img/:name', (req, res) => {
    const {name} = req.params
    res.sendFile(`/Users/rikku/Documents/cinema/back-end/public/img/${name}`)
})

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);
});

export default connection;

