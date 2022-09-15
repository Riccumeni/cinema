import express from 'express';
import mysql from 'mysql';
import cors from 'cors'
import cookieParser from 'cookie-parser';
import path from 'path';
import { fileURLToPath } from 'url';
import fetch from 'node-fetch'
import qrcode from 'qrcode'

import userRoutes from './routes/users.js'
import authRoutes from './routes/auth.js'
import filmRoutes from './routes/film.js'
import siteRoutes from './routes/site.js'

const app = express();
const PORT = 3000;
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.use(express.json()) // attenzione, i middleware vanno prima dei routes
app.use(express.urlencoded({extended:true}))
app.use(cors())
app.use(cookieParser())

app.use('/users', userRoutes); 
app.use('/auth', authRoutes); 
app.use('/api/film', filmRoutes);
app.use('/', siteRoutes)

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

app.get('/api/palinsesto', (req, res) => {
    connection.query(`select distinct film.locandina, spettacolo.nomefilm as nome
    from spettacolo, film 
    where spettacolo.nomefilm = film.nome and spettacolo.iniziofilm > current_date;`, (err, results) => {
        res.json(results);
    })
})



app.get('/wiki', async (req, res) => {
    const response = await fetch('https://it.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&exlimit=1&titles=naruto&explaintext=1&exsectionformat=plain')
    const json = await response.json()
    res.json(json['query']['pages'])
})

app.get('/qr', async (req, res) => {
    const data = {
        name: 'alessandro',
        spettacolo: 4
    }

    let json = JSON.stringify(data)

    qrcode.toString(json,{type:'svgf'}, function (err, url) {
        if(err) return console.log("error occured")
        console.log(url)
        res.send(url)
    })

    qrcode.toDataURL(json, function (err, url) {
        if(err) return console.log("error occured")
        console.log(url)
    })

    res.status(200)
})

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);
});

export default connection;

