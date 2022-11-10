import React from 'react'
import ReactDOM from 'react-dom/client'
import { BrowserRouter, Routes, Route, createBrowserRouter, RouterProvider } from 'react-router-dom'
import App from './App'
import './index.css'
import Models from './routes/models';
import Info from './routes/info';
import Configurator from './routes/configurator'

const router = createBrowserRouter([
  {
    path: "/",
    element: <App/>,
  },
  {
    path: "configurator/:carId",
    element: <Configurator/>,
    errorElement: <Error/>,
  },
  {
    path: "info",
    element: <Info/>,
  },
  {
    path: "models",
    element: <Models/>
  },
]);

ReactDOM.createRoot(document.getElementById('root')).render(
  <RouterProvider router={router}/>
)