function fn(){
    var env = karate.env || 'dev';
    karate.log('Ejecutando en ambiente', env);

    var config = {
        baseURL: 'https://dummyjson.com',
        baseTokenURL: 'https://dummyjson.com/auth/login'
    };
    //Configuracion global de SSL
    karate.configure('ssl',  true);

    if (env === 'qa') {
        config.baseURL = 'https://qa.dummyjson.com';
    }

    return config;
}