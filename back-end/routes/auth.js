import express, { Router } from 'express';
import {register, login} from '../controllers/auth.js'

const router = express.Router();

router.put('/register', register)

router.post('/login', login)

export default router;