import express from 'express'
import bcrypt from 'bcryptjs'
import connection from '../index.js';

export const register = async (req, res) => {
    const {nome, cognome, email, password, datanascita} = req.body;

    const hashedPassword = await bcrypt.hash(password, 10);

    try{
        await connection.query(`insert into utente (nome, cognome, email, password, datanascita, permessi) values ('${nome}', '${cognome}', '${email}', '${hashedPassword}', '${datanascita}', 'u')`)
    }catch(error){
        res.status(404).json({"message" : error.message})
    }
    res.json({"success" : true, "message" : "utente registrato con successo"})
}

export const login = async (req, res) => {
    const {email, password} = req.body;
    let id = -1;

    try{
        await connection.query(`select codice from utente where email=${email} and password=${password}`, (err, result) => {
            if (err){
                return;
            }
            id = result[0]["codice"];
        })
    }catch(error){
        res.status(404).json({"message" : error.message})
    }
    res.json({"success" : true, "id" : id})
}