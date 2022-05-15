const express = require('express');
const app = express();
const bodyparser = require('body-parser');

app.use(bodyparser.urlencoded({ extended: false }));
app.use(bodyparser.json());

const path = require("path");
const htmlPath = path.join(__dirname, "/Pages");
app.use(express.static(htmlPath));

app.set('views' , './Pages');
app.set('view engine', 'ejs');

app.get('/inscription', (req, res) => 
{
    res.sendFile(__dirname + "/Pages/signup.html")    
})

app.get('/connexion_client', (req, res) => 
{
    res.sendFile(__dirname + "/Pages/index-connected.html")    
})

app.get('/', (req, res) => 
{
    res.sendFile(__dirname + "/Pages/index.html")    
})
 
app.get('/connexion', (req, res) => 
{
    res.sendFile(__dirname + "/Pages/login.html")  
})

app.get('/recherche_hotel', (req, res) => 
{
    res.sendFile(__dirname + "/Pages/hotel")  
})



const client_inscription = require('./Routes/client_inscription');
//const client_update = require('./Routes/client_update_info_perso');
const client_historique = require('./Routes/client_historique');
const client_consulter_info_perso = require('./Routes/client_consulter_info_perso');
const client_connecter = require('./Routes/client_connexion');
const hotel_recherche = require('./Routes/recherche_hotel');

app.use('/inscription', client_inscription);
//app.use('/update', client_update);
app.use('/historique', client_historique);
app.use('/recherche_hotel',hotel_recherche);
app.use('/consulter', client_consulter_info_perso);
app.use('/connexion', client_connecter);

app.listen(5500, ()=> console.log('Server lance'));

