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