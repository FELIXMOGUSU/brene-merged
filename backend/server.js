import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import mpesaRouter from './routes/mpesa.js';
dotenv.config(); const app=express(); app.use(cors()); app.use(express.json()); app.get('/api/health',(_req,res)=>res.json({ok:true,message:'House of Brene backend running'})); app.use('/api/mpesa',mpesaRouter); const port=process.env.PORT||5000; app.listen(port,()=>console.log(`Server running on http://localhost:${port}`));
