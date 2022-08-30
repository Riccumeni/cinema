import express, { Router } from 'express';

export const verifyLogIn = (req, res, next) => {
    console.log('helo')
    if(req.cookies['id'] != null){
        next()
    }else{
        res.json({"success" : false, "message" : "Prima di prenotare bisogna effettuare il login"})
    }
}