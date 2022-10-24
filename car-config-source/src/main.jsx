import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import App from './App'
import './index.css'
import Models from './routes/models';
import Info from './routes/info';

ReactDOM.createRoot(document.getElementById('root')).render(
  <BrowserRouter>
    <Routes>
      <Route path='/' element={<App/>}/>
      <Route path='models' element={<Models/>}/>
      <Route path='info' element={<Info/>}/>
    </Routes>
  </BrowserRouter>
)
