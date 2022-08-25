import express, { Router } from 'express';
import connection from '../index.js';
import {verifyLogIn} from '../middlewares/auth.js'

const router = express.Router();

router.get('/:name', (req, res) => {
    const {name} = req.params;
    const nameWithoutDash = name.replace('-', ' ');
    
    connection.query(`select * from film where nome like '${nameWithoutDash}';select * from spettacolo where nomefilm like '${nameWithoutDash}' and spettacolo.iniziofilm > current_date;`, (err, results) => {
        if(err) throw err;

        let film = results[0][0];
        let spettacoli = results[1];

        res.json({"success" : true, "film" : film, "spettacoli" : spettacoli})
    });
})

router.get('/prenota/:codiceSpettacolo', verifyLogIn, (req, res) => {

    
})

export default router;