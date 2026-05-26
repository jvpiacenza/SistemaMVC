const express = require('express');
const router = express.Router();
const produtosController = require('../controllers/produtosController')

router.get('/produtos', produtosController.index)
router.delete('/produtos/:id', produtosController.deletar)


module.exports = router