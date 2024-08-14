
import React,{ useEffect, useState } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';
import Movielist from './components/Movielist';

import Search from './components/Search';


const API_URL="https://api.themoviedb.org/3/movie/popular?api_key=b80142a02dfb0192723eeffdfdd9d7a5";

function App() {
  const [movies,setMovies] = useState([ ]);
  useEffect(() => {
    fetch(API_URL)
    .then((res)=>res.json())
    .then(data =>{console.log(data)
    setMovies(data.results);
  });
  } , [])
 
  
  return (
    <>
    <Search/>
    <div className='container'>
      <div className='grid'>
         {movies.map((moviereq)=>
          <Movielist key={moviereq.id} {...moviereq}/>)}
      </div>
    </div>
    </>
    
  );
}

export default App