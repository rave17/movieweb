const key = '46c6780d73f308058d27fb505c9898d4'
const imgUrl ="https://image.tmdb.org/t/p/w500/";

$(document).ready(() => {
  $('#searchForm').on('submit', (e) => {
    let searchText = $('#searchText').val();
    getMovies(searchText);
    e.preventDefault();
  });
});


function getMovies(searchText){
  axios.get(`https://api.themoviedb.org/3/search/movie?api_key=${key}&query=${searchText}`)
    .then((response) => {

      let movies = response.data.results;
      
     
  for(movie in movies){
    let output = '';
    $.each(movies, (index, movie) => {
      
      output += `

      <div class="col-md-3 col-sm-12 card-body" id=${movie.id}>
      <img src=${imgUrl + movie.poster_path} class="img-fluid" id="#moviePoster" alt=${movie.title} data-movie-id=${movie.id}/>
  </div>
  <div class="col-md-7 col-sm-12 card-body">
      <h5 class="pb-4" id="movieTitle">${movie.title}</h5>
      <p class="py-2" id="#genreMovie">${movie.genre}</p>
      <p class="pb-4" id="movieSynopsis">${movie.overview}</p>
      <button class="btn btn-success" id="#addFavorite">
          <a href="userprofile.html#list">Add to favorite</a>
      </button>
   
      <a onclick="movieSelected('${movie.id}')" class="btn btn-info" href="#">Movie Details</a>

     
  </div>`;

    });
    $('#movies').html(output);
  }

    })
    .catch((err) => {
      console.log(err);
    });
}

function movieSelected(id){
  sessionStorage.setItem('id', id);
  console.log(sessionStorage)
  window.location = 'movie.html';
  return false;
}

function getMovie(){
  let movieId = sessionStorage.getItem('id');
    console.log(movieId)
  axios.get(`https://api.themoviedb.org/3/movie/${movieId}?api_key=${key}&language=en-US`)
    .then((response) => {
      console.log(response.data);
     
      let movie = response.data
      let output =`
      <div class="col-md-3 col-sm-12 card-body" id=${movie.id}>
      <img src=${imgUrl + movie.poster_path} class="img-fluid" id="#moviePoster" alt=${movie.title} data-movie-id=${movie.id}/>
  </div>
  <div class="col-md-7 col-sm-12 card-body">
      <h5 class="pb-4" id="movieTitle">${movie.title}</h5>

      <p class="pb-4" id="movieSynopsis">${movie.overview}</p>
      
          <a href="userprofile.html#list" class="btn btn-success">Add to favorite</a>
      
      <a href="userhome.html" class="btn btn-info">Go Back To Search</a>
        <hr>
          </div>
        </div> 
      `;
      $('#movie').html(output);
    
    })
    .catch((err) => {
      console.log(err);
    });
}
