const express = require('express');
const router = express.Router();
const aluguelController = require('../controllers/aluguelController');

router.get('/aluguel', aluguelController.ver);
router.delete('/aluguel/:id', aluguelController.deletar);
router.post('/aluguel', aluguelController.criar);
router.put('/aluguel/:id', aluguelController.atualizar);

module.exports = router;