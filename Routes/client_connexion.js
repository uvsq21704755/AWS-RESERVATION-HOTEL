const express = require('express');
const router = express.Router();
const {MongoClient} = require('mongodb');

  
const uri = "mongodb+srv://salah:salah@cluster0.ugogl.mongodb.net/aws?retryWrites=true&w=majority";
const client = new MongoClient(uri);

router.post('/', async (req, res) => {
    const obj = Object.assign({},req.body);
    try{
        await client.connect();
        const tuple_client = await client.db("aws").collection("Client").findOne( { adr_mail: obj.email });
        console.log(obj);
            if(tuple_client){
                if(tuple_client.mot_de_passe == obj.password){
                    res.status(400).send("connexion réussite");
                }else{
                     res.status(400).send("Mot de passe incorrect");
                }
            }
            else
            {
                res.status(400).send("Identifiant incorrect");
            }
        } catch (e) {
            console.error(e);
        } finally {
            client.close();
        }
      });
      
module.exports = router;