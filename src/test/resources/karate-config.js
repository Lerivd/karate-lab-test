function fn(){

    var config = {
        baseURL: 'https://dummyjson.com'
    };
    //Configuracion global de SSL
    karate.configure('ssl',  true);

    return config;
}