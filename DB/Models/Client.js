const mongoose = require("mongoose");

const ClientModel = mongoose.model(
    "aws",
    {
    ID_CLIENT: {
      type: Number,
      required: true
    },
    nom: {
      type: String,
      required: true
    },
    prenom: {
      type: String,
      required: true
    },
    N_tel: {
        type: String,
        required: true
    },
    adr_mail: {
        type: String,
        required: true
    },
    pays: {
        type: String,
        required: true
    },
    mot_de_passe: {
        type: String,
        required: true
    },
    fidelite: {
        type: Number,
        required: true
    }
  },
  "Client"
);

module.exports = {ClientModel};