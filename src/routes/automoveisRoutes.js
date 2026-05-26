const express = require('express');
const router = express.Router();
const automoveisController = require('../controllers/automoveisController');

router.get('/automoveis', automoveisController.ver);
router.delete('/automoveis/:id', automoveisController.deletar);
router.post('/automoveis', automoveisController.criar);
router.put('/automoveis/:id', automoveisController.atualizar);

module.exports = router;