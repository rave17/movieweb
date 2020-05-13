const keyGenres = '46c6780d73f308058d27fb505c9898d4';
const container = document.getElementById('#containerOneMovie');

function getGenres(){
    let genreText = '';

    const urlGenres = `https://api.themoviedb.org/3/genre/movie/list?api_key=${keyGenres}&language=en-US`;

    fetch(urlGenres)
    .then(res => res.json())
    .then(data => {
        console.log(data)
        let genre = data.genres;
        const createGenres = () => {
            if(genre){
                let idGenre = '35';
                for(i in genre){
                    let newData = genre[i];
                    genreText += `genero: ${newData} `
                    container.innerHTML = genreText;
                }}
            }      
            createGenres();
    }) 
    .catch(err=>console.error(err))
}
getGenres();



