const key = '46c6780d73f308058d27fb505c9898d4';
const imgUrl ="https://image.tmdb.org/t/p/w500/";


/* search movies */
const inputSearch = document.getElementById('#inputSearch');
const searchBtn = document.getElementById('#searchBtn');
const containerMoviesList = document.getElementById('#containerMoviesList');

//crete info genre
 function getGenres(){
        const urlGenres = `https://api.themoviedb.org/3/genre/movie/list?api_key=${key}&language=en-US`;
            fetch(urlGenres)
            .then(res => res.json())
            .then(dataGenre => {
                const resGenres = dataGenre.genres[2].name;
                for(i = 0; i < resGenres.length; i++){
                    const nameGenre = resGenres[i].name;
                    console.log(nameGenre)
                    return nameGenre;
                }

                console.log('fetch: ' + resGenre)
                return resGenre;
            }) 
            .catch(err=>console.error(err +' data'))
            };


//create info movie
function movieSection(resMovie, resGenres){
    let genreText = '';  
    let peliculas = '';

    for(genre in resGenres){
        console.log('dato: ' + genre)
        return genre;
    }

    resMovie.forEach((movie)=>{

        if(movie.poster_path ){ 



            peliculas +=`<div class="col-md-3 col-sm-12 card-body" id=${movie.id}>
                            <img src=${imgUrl + movie.poster_path} class="img-fluid" id="#moviePoster" alt=${movie.title} data-movie-id=${movie.id}/>
                        </div>
                        <div class="col-md-7 col-sm-12 card-body">
                            <h5 class="pb-4" id="movieTitle">${movie.title}</h5>
                            <p class="py-2" id="#genreMovie"></p>
                            <p class="pb-4" id="movieSynopsis">${movie.overview}</p>
                            <button class="btn btn-success" id="#addFavorite">
                                <a href="userprofile.html#list">Add to favorite</a>
                            </button>
                            <button class="btn btn-info" id="#seeMovie">
                                <a href="movie.html"> See more</a>
                            </button>
                        </div>`;
                               
                  };
                  console.log('id genero movie: ' + movie.genre_ids)
                    console.log('genre name: ')                                     
    });
    return peliculas;
}


//create container movie
function createMovie(resMovie, resGenres)
{
    const containerMovie = document.createElement('div');
    containerMovie.setAttribute('class', 'col-md-10 col-sm-10 card-deck d-flex justify-content-between mx-auto mb-4');

    const movieData = movieSection(resMovie);

    containerMovie.innerHTML = movieData;

    return containerMovie;
}



//search movie
searchBtn.onclick = function(e){
    e.preventDefault();

    const toSearch = inputSearch.value;
    const urlSearch = `https://api.themoviedb.org/3/search/movie?api_key=${key}&query=${toSearch}`;

    fetch(urlSearch)
    .then(res => res.json())
    .then(data => {
 
        const resMovie = data.results;

        const movieInfo = createMovie(resMovie);
        containerMoviesList.appendChild(movieInfo);

    })
    .catch(err=>console.error(err))
}

