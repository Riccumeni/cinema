import express, { Router } from 'express';
import connection from '../index.js';
import {register} from '../controllers/auth.js'

const router = express.Router();

router.put('/register', register)

export default router;