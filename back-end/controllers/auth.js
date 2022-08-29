import express from 'express'
import bcrypt from 'bcryptjs'
import connection from '../index.js';

export const register = async (req, res) => {
    const {nome, cognome, email, password, datanascita} = req.body;

    if(!email || !password || !nome || !cognome || !datanascita){
        res.json({"success" : false, "message" : "inserire le credenziali"})
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    try{
        await connection.query(`insert into utente (nome, cognome, email, password, datanascita, permessi) values ('${nome}', '${cognome}', '${email}', '${hashedPassword}', '${datanascita}', 'u')`)
    }catch(error){
        res.status(404).json({"message" : error.message})
    }
    res.json({"success" : true, "message" : "utente registrato con successo"})
}

export const login = async (req, res) => {
    const account = req.body;
    const email = account['email'];
    const password = account['password']
    console.log(account);
    let id = -1;
    let nome
    console.log(`Email: ${account['email']}, Password: ${account['password']}`);
    if(!email || !password){
        res.json({"success" : false, "message" : "inserire le credenziali"})
    }

    try{
        await connection.query(`select codice, nome, password from utente where email like '${email}'`, (error, results) => {
            try{
                let passwordHashed = results[0]['password'];
                if(bcrypt.compare(password, passwordHashed)){
                    id = results[0]["codice"];
                    nome = results[0]["nome"];
                    res.cookie('id', id)
                    res.cookie('name', nome)
                    res.json({"success" : true})
                }else{
                    res.status(200).json({"message" : "credenziali non corrette"})
                }  
            }catch(error){
                res.json({'success' : false, 'message' : 'credenziali non corrette'})
            }
            
        })
    }catch(error){
        res.status(404).json({"message" : error.message})
    }
    
}