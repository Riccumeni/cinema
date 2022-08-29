import express, { Router } from 'express';
import connection from '../index.js';
import {verifyLogIn} from '../middlewares/auth.js'

const router = express.Router();

router.get('/:name', (req, res) => {
    const {name} = req.params;
    const nameWithoutDash = name.replace('-', ' ');
    
    connection.query(`select * from film where nome like '${nameWithoutDash}';
    select spettacolo.codice, spettacolo.nomefilm, spettacolo.iniziofilm, spettacolo.finefilm, spettacolo.codicesala, sala.numeroposti, sala.numeroposti - count(prenotazione.codicespettacolo)  as "postidisponibili"
    from spettacolo, sala, prenotazione
    where (sala.codice = spettacolo.codicesala and spettacolo.codice = prenotazione.codicespettacolo) and spettacolo.nomefilm='${nameWithoutDash}' and  spettacolo.iniziofilm > current_date
    group by spettacolo.codice;
    select spettacolo.codice, spettacolo.nomefilm, spettacolo.iniziofilm, spettacolo.finefilm, spettacolo.codicesala, sala.numeroposti as 'postidisponibili'
    from sala, spettacolo
    where spettacolo.codicesala = sala.codice and spettacolo.nomefilm='${nameWithoutDash}' and spettacolo.iniziofilm > current_date
    group by spettacolo.codice`, (err, results) => {
        if(err) throw err;

        let film = results[0][0];

        let spettacoli;

        if(results[0][1] == null){
            spettacoli = results[2];
        }else{
            spettacoli = results[1];
        }
        
        res.json({"success" : true, "film" : film, "spettacoli" : spettacoli})
    });
})

router.get('/img/:name', (req, res) => {
    const {name} = req.params
    res.sendFile(`/Users/rikku/Documents/cinema/back-end/public/img/locandine/${name}`)
})

router.get('/:name/:codiceSpettacolo', verifyLogIn, (req, res) => {
    const {codiceSpettacolo} = req.params
    const id = req.cookies['id'];

    connection.query(`select sala.numeroposti - count(prenotazione.codicespettacolo) as 'postidisponibili' from sala, prenotazione, spettacolo where (sala.codice = spettacolo.codicesala and spettacolo.codice = prenotazione.codicespettacolo) and spettacolo.codice = ${codiceSpettacolo}`, (err, results) => {
        if(err) throw err;

        if(results[0]['postidisponibili']  <= 0){
            res.json({'message' : 'spettacolo pieno!'})
        }else{
            connection.query(`insert into prenotazione (codiceutente, codicespettacolo) values ('${id}', '${codiceSpettacolo}')`, (err) => {
                if(err) throw err;
                console.log('query successfull!');
            })
            res.status(200).json({'message' : 'prenotato con successo!'})
        }
    })
})

export default router;