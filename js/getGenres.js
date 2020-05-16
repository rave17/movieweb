/* const keyGenres = '46c6780d73f308058d27fb505c9898d4';

function getGenres(){
   
    const urlGenres = `https://api.themoviedb.org/3/genre/movie/list?api_key=${keyGenres}&language=en-US`;

    fetch(urlGenres)
    .then(res => res.json())
    .then(data => {
        console.log(data)
        let genre = data.genres;
     
        (createGenres = () => {
            if(genre){
                for(i in genre){
                    const newData = genre[i];
              
                    console.log(newData)
                } 
                console.log(genre[i])
                return genre[i];
            } 
        })();      
    }) 
    .catch(err=>console.error(err))
}
getGenres();
 */


