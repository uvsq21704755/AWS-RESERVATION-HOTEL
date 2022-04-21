const express = require('express');
const router = express.Router();

const {ClientModel}  = require('../Models/Client');

router.get('/', (req, res) => {
    ClientModel.find((err, docs) => {
      if (!err) res.send(docs);
      else console.log("Error to get data : " + err);
    })
  });
  

module.exports = router;