const express = require ('express');
const router = express.Router();

const conn = require('../database');

router.get('/', (req,res)=>{

    res.send('Login');
});

module.exports = router;