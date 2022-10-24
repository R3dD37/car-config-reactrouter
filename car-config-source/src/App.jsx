import { useState } from 'react'
import { Link } from 'react-router-dom'
import reactLogo from './assets/react.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <div className="App">
      <h1>Jestem sobie z Vite'a</h1>
      <nav>
        <Link to="/info">Info Page</Link> |{" "}
        <Link to="/models">Car Models</Link>
      </nav>
    </div>
  )
}

export default App
