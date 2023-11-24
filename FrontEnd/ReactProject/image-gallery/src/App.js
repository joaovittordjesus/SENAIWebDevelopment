/*import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App; */

// Arquivo de estilos CSS do componente App
import './App.css';
// Importa o módulo React para usar no código.
import React from 'react';
// Importa o componente Gallery que foi criado em 'Gallery.js'.
import Gallery from './Gallery';
// Define o componente principal da aplicação, chamado 'App'.
function App() {
return (
<div className="App">
{/* 4. Renderiza o componente Gallery dentro do componente App */}
<Gallery />
</div>
);
}
// Exporta o componente 'App' como o componente principal da aplicação.
export default App;
