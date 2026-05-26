require('dotenv').config()
const express = require('express');
const cors = require('cors');

const pessoaRoutes = require('./src/routes/pessoasRoutes');
const produtosRoutes = require('./src/routes/produtosRoutes')


const server = express();
server.use(cors());
server.use(express.json());

const PORT = process.env.porta

server.listen(PORT, () => {
    console.log(`Servidor rodando no http://localhost:${PORT}`);
})

server.use(pessoaRoutes);
server.use(produtosRoutes)
//ordem é models, controllers e routes
