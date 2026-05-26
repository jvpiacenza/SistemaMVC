const express = require('express');
const router = express.Router();
const pessoasController = require('../controllers/pessoasController')

router.get('/pessoas', pessoasController.ver)
router.delete('/pessoas/:id', pessoasController.deletar)
router.post('/pessoas', pessoasController.criar);
router.put('/pessoas/:id', pessoasController.atualizar);


module.exports = router