import { useState } from 'react'
import { Link } from 'react-router-dom'
import './App.css'

function App() {
  return (
    <div className="App">
      <h1>Volkswagen - WiP</h1>
      <nav>
        <Link to="/info">Info Page</Link> |{" "}
        <Link to="/models">Car Models</Link> | {" "}
        <Link to='/configurator'>Car Config</Link>
      </nav>
    </div>
  )
}

export default App
