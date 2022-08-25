import express from 'express';
import mysql from 'mysql';
import cors from 'cors'
import cookieParser from 'cookie-parser';

import userRoutes from './routes/users.js'
import programmazioneRoutes from './routes/programmazione.js'
import authRoutes from './routes/auth.js'
import filmRoutes from './routes/film.js'

const app = express();
const PORT = 3000;

app.use(express.json()) // attenzione, i middleware vanno prima dei routes
app.use(express.urlencoded({extended:true}))
app.use(cors())
app.use(cookieParser())

app.use('/users', userRoutes); 
app.use('/programmazione', programmazioneRoutes); 
app.use('/auth', authRoutes); 
app.use('/film', filmRoutes);

const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'root',
    database : 'cinema',
    port     : 8889,
    multipleStatements: true
});

connection.connect((err) => {
    if(err){
        console.error("errore");
        return;
    }

    console.log("connected");
})

app.get('/', (req, res) => {
    res.json({"success" : true})
})

/*
connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
    if (error) throw error;
    console.log('The solution is: ', results[0].solution);
});
*/

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);
});

export default connection;

