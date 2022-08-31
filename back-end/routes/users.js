import express, { Router } from 'express';
import connection from '../index.js';

const router = express.Router();

router.get('/', (req, res) => {
    connection.query('select * from utente', (err, results) => {
        res.json(results);
    })
})

router.post('/:id', (req, res) => {
    const {id} = req.params;

    connection.query(`select nome, cognome, email, datanascita from utente where codice=${id}`, (err, results) => {
        res.json(results[0]);
    })
})

router.post('/prenotazioni', (req, res) => {
    const {id} = req.body
    connection.query(`select nomefilm, iniziofilm from spettacolo, prenotazione where prenotazione.codicespettacolo = spettacolo.codice and iniziofilm > current_date`, (err, results) => {
        res.json(results[0])
    })
})

export default router;