var APIKeyPlugin = {
    
getKeys: function (success, fail, resultType) {
    return Cordova.exec( success, fail, 
                        "com.graziemobile.BarLouie.APIKey", 
                        "getKeys", 
                        [resultType]);
    }
};