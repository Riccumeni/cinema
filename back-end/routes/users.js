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

export default router;