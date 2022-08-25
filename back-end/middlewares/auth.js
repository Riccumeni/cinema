import express, { Router } from 'express';

export const verifyLogIn = (req, res, next) => {
    if(req.cookies['id'] != null){
        next()
    }else{
        res.json({"success" : false, "message" : "Prima di prenotare bisogna fare il login"})
    }
}