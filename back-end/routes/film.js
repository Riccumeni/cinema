import express, { Router } from 'express';
import connection from '../index.js';

const router = express.Router();

router.get('/:name', (req, res) => {
    const {name} = req.params;
    const nameWithoutDash = name.replace('-', ' ');
    var film = null, spettacoli = null;
    
    connection.query(`select * from film where nome like '${nameWithoutDash}'`, (err, results) => {
        if(err) throw err;
        this.film = results[0];
        // res.json(film)
    });
    
    connection.query(`select * from spettacolo where nomefilm like '${nameWithoutDash}' and spettacolo.iniziofilm > current_date`, (err, results) => {
        if(err) throw err;
        spettacoli = results;
        // res.json(spettacoli)
    });

    res.json({"success" : true, "film" : film, "spettacoli" : spettacoli})
})

export default router;