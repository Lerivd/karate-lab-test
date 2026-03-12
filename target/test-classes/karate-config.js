function fn(){
    var env = karate.env || 'dev';
    karate.log('Ejecutando en ambiente', env);

    var config = {
        baseURL: 'https://dummyjson.com'
    };
    //Configuracion global de SSL
    karate.configure('ssl',  true);

    return config;
}