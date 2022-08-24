import express, { Router } from 'express';
import connection from '../index.js';
import {ricerca} from '../controllers/programmazione.js'

const router = express.Router();

router.get('/', (req, res) => {
    connection.query('select spettacolo.codice, spettacolo.nomefilm, spettacolo.iniziofilm, spettacolo.finefilm from spettacolo where spettacolo.iniziofilm > current_date', (err, results) => {
        res.json(results);
    })
})

router.get('/:id', (req, res) => {
    const {id} = req.params;
    connection.query(`select spettacolo.codice, spettacolo.nomefilm, spettacolo.iniziofilm, spettacolo.finefilm, spettacolo.codicesala from spettacolo where codice=${id}`, (err, results) => {
        res.json(results);
    })
})


export default router;