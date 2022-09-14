import express, { Router } from 'express';
import connection from '../index.js';
import {verifyLogIn} from '../middlewares/auth.js'

const router = express.Router();

router.get('/:name', (req, res) => {
    const {name} = req.params;
    const nameWithoutDash = name.replace('-', ' ');
    
    connection.query(`select * from film where nome like '${nameWithoutDash}';
    select sala.codice as 'codicesala', spettacolo.codice, spettacolo.nomefilm, spettacolo.iniziofilm, spettacolo.finefilm, sala.numeroposti, sala.numeroposti - count(prenotazione.codiceutente)  as "postidisponibili"
    from prenotazione
    right join spettacolo on prenotazione.codicespettacolo = spettacolo.codice
    inner join sala on sala.codice = spettacolo.codicesala
    where spettacolo.nomefilm='${nameWithoutDash}' and  spettacolo.iniziofilm > current_date
    group by spettacolo.codice;`, (err, results) => {
        if(err) throw err;

        let film = results[0][0];

        let spettacoli = results[1];

        console.log('film: ' + results);
        
        res.json({"success" : true, "film" : film, "spettacoli" : spettacoli})
    });
})

router.get('/search/:name', (req, res) => {
    const {name} = req.params
    connection.query(`select * from film where nome like '${name}%' order by nome`, (err, results) => {
      if(err){
        res.status(500).json({'message': 'errore'})
      }
      res.status(200).json({'data' : results})  
    })
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

router.get('/spettacoli/getDate/:nome', (req, res) => {
    const {nome} = req.params
    console.log(nome);
    connection.query(`select DAY(spettacolo.iniziofilm) as 'day', MONTH(spettacolo.iniziofilm) as 'month' from spettacolo where spettacolo.nomefilm = '${nome}' and spettacolo.iniziofilm > current_date limit 3`, (err, results) => {
        if(err){
            res.status(500)
        }
        res.json(results)
    })
})

export default router;