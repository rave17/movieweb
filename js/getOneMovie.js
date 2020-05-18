
$(document).ready(() =>{
    showSome();
    scrollWin(x, y);
})
 
function showSome(){
    axios.get(`https://api.themoviedb.org/3/movie/top_rated?api_key=${key}&language=en-US&page=1`)
    .then((response) => {
        let movies = response.data.results;
      
     
        for(movie in movies){
            let output = '';
            
            let urlTop = `${imgUrl}`+movies[movie].poster_path 
            console.log(urlTop)
            
   
            output += `
           <img src=${urlTop} onclick="movieSelected('${movie.id}')" class="imgPointer" id="#moviePoster" alt=${movie.title}/>
            `;

         
          $('#carouselMovies').append(output);
        }

    })  .catch((err) => {
        console.log(err);
      });
  }


  function scrollWin(x, y) {
    $('#carouselMovies').scrollBy(x, y);
  }






