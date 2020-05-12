const key = '46c6780d73f308058d27fb505c9898d4';
const imgUrl ="https://image.tmdb.org/t/p/w500/";


/* search movies */
const inputSearch = document.getElementById('#inputSearch');
const searchBtn = document.getElementById('#searchBtn');
const containerMoviesList = document.getElementById('#containerMoviesList');

//...........inner to carrousel
/* function movieCarrousel(resAllMovies){
    return resAllMovies.map((movie)=>{
        if(movie.poster_path){
        return `
       
        <div class="carousel-item" id=${movie.id}>
            <img src=${imgUrl + movie.poster_path} class="d-block w-100" alt=${movie.title} data-movie-id=${movie.id}/>
        </div>`
        } else {
            return null;
        };
    })
};

function createCarrousel(resMovie){
    const movieCarrousel = document.createElement('div');
    movieCarrousel.setAttribute('class', 'carrousell-inner');

    const oneMovieCarrousel = movieCarrousel(resMovie);

    movieCarrousel.innerHTML = oneMovieCarrousel;
    return movieCarrousel;
}
 ------------------------*/

//create info movie
function movieSection(resMovie){
    return resMovie.map((movie)=>{
        if(movie.poster_path){
        return `  
        <div class="col-md-3 card-body" id=${movie.id}>
            <img src=${imgUrl + movie.poster_path} class="imgMovie img-fluid" alt=${movie.title} data-movie-id=${movie.id}/>
        </div>
            <div class="col-md-7 card-body">
            <h5 class="pb-4" id="movieTitle">${movie.title}</h5>
            <p class="py-2">${movie.genres_ids}</p>
            <p class="pb-4" id="movieSynopsis">${movie.overview}</p>
            <button class="btn btn-success" id="#addFavorite">
                <a href="userprofile.html#list">Add to favorite</a>
            </button>
            <button class="btn btn-info" id="#seeMovie">
                <a href="movie.html"> See more</a>
            </button>
          </div>`
        } else {
            return null;
        };
    })
};

//create container movie
function createMovie(resMovie){
    const containerMovie = document.createElement('div');
    containerMovie.setAttribute('class', 'col-md-10 card-deck d-flex justify-content-between mx-auto mb-4');

  const movieData = movieSection(resMovie);

    containerMovie.innerHTML = movieData;
    return containerMovie;
}

//search movie
searchBtn.onclick = function(e){
    e.preventDefault();
    const toSearch = inputSearch.value;
    console.log('value '+ toSearch) 

    const urlSearch = `https://api.themoviedb.org/3/search/movie?api_key=${key}&query=${toSearch}`;

    fetch(urlSearch)
    .then(res => res.json())
    .then(data => {
 
        const resMovie = data.results;
        console.log(resMovie)

        const movieInfo = createMovie(resMovie);
        containerMoviesList.appendChild(movieInfo);
    })
    .catch(err=>console.error(err))
}

//go one movie

document.onclick =function(event){
    const target = event.target;
    if(target.tagName.toLowerCase()==='img'){
        const movieID = target.dataset.movieId;
        console.log(movieID)
        const containerM = event.target.parentElement;
        const content = containerM.nextElementSibling;
    }
}
//get one movie to click
/* function createOneMovie(movieID){
    const containerOneMovie = document.getElementById('#containerOneMovie');

    return movieID.map((movie)=>{
        if(movie.poster_path){
        return `  
        <div class="col-md-3 card-body" id=${movie.id}>
            <img src=${imgUrl + movie.poster_path} class="imgMovie img-fluid" alt=${movie.title} data-movie-id=${movie.id}/>
        </div>
            <div class="col-md-7 card-body">
            <h5 class="pb-4" id="movieTitle">${movie.title}</h5>
            <p class="pb-4" id="movieSynopsis">${movie.overview}</p>
            <button class="btn btn-success" id="#addFavorite">
                <a href="userprofile.html#list">Add to favorite</a>
            </button>
            <button class="btn btn-info" id="#seeMovie">
                <a href="movie.html"> See more</a>
            </button>
          </div>`
        } else {
            return null;
        };
    })
} */

