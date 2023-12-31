@isTest
global class CountryApiServiceMock implements HttpCalloutMock {
    global static HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('[{' + 
        '"name": "Afghanistan",' + 
        '"topLevelDomain": [".af"],' + 
        '"alpha2Code": "AF",' + 
        '"alpha3Code": "TST",' + 
        '"callingCodes": ["93"],' + 
        '"capital": "Kabul",' + 
        '"altSpellings": [' + 
            '"AF",' + 
            '"Afġānistān"' + 
        '],' + 
        '"region": "Asia",' + 
        '"subregion": "Southern Asia",' + 
        '"population": 27657145,' + 
        '"latlng": [33,65],' + 
        '"demonym": "Afghan",' + 
        '"area": 652230,' + 
        '"gini": 27.8,' + 
        '"timezones": [' + 
            '"UTC+04:30"' + 
        '],' + 
        '"borders": [' + 
            '"IRN",' + 
            '"PAK",' + 
            '"TKM",' + 
            '"UZB",' + 
            '"TJK",' + 
            '"CHN"' + 
        '],' + 
        '"nativeName": "افغانستان",' + 
        '"numericCode": "004",' + 
        '"currencies": [' + 
            '{' + 
                '"code": "AFN",' + 
                '"name": "Afghan afghani",' + 
                '"symbol": "؋"' + 
            '}' + 
        '],' + 
        '"languages": [' + 
            '{' + 
                '"iso639_1": "ps",' + 
                '"iso639_2": "pus",' + 
                '"name": "Pashto",' + 
                '"nativeName": "پښتو"' + 
            '},' + 
            '{' + 
                '"iso639_1": "uz",' + 
                '"iso639_2": "uzb",' + 
                '"name": "Uzbek",' + 
                '"nativeName": "Oʻzbek"' + 
            '},' + 
            '{' + 
                '"iso639_1": "tk",' + 
                '"iso639_2": "tuk",' + 
                '"name": "Turkmen",' + 
                '"nativeName": "Türkmen"' + 
            '}' + 
        '],' + 
        '"translations": {' + 
            '"br": "Afeganistão",' + 
            '"de": "Afghanistan",' + 
            '"es": "Afganistán",' + 
            '"fa": "افغانستان",' + 
            '"fr": "Afghanistan",' + 
            '"hr": "Afganistan",' + 
            '"it": "Afghanistan",' + 
            '"ja": "アフガニスタン",' + 
            '"nl": "Afghanistan", ' +  
            '"pt": "Afeganistão" ' + 
        '}, ' + 
        '"flag": "https://restcountries.eu/data/afg.svg", ' + 
        '"regionalBlocs": [ ' + 
            '{ ' + 
                '"acronym": "SAARC",' + 
                '"name": "South Asian Association for Regional Cooperation"}],"cioc": "AFG"},{ '+
        '"name": "Germany",' +
       ' "topLevelDomain": [' +
           ' ".de"' +
        '],' +
        '"alpha2Code": "DE",' +
        '"alpha3Code": "DEU",' +
        '"callingCodes": [' +
            '"49"' +
        '],' +
        '"capital": "Berlin",' +
        '"altSpellings": [' +
            '"DE",' +
            '"Federal Republic of Germany",' +
            '"Bundesrepublik Deutschland"' +
        '],' +
        '"region": "Europe",' +
        '"subregion": "Western Europe",' +
        '"population": 81770900,' +
        '"latlng": [' +
             '51,' +
             '9' +
        '],' +
         '"demonym": "German",' +
         '"area": 357114,' +
         '"gini":  28.3,' +
         '"timezones": [' +
             '"UTC+01:00"' +
        '],' +
        '"borders": [' +
            '"AUT",' +
            '"BEL",' +
            '"CZE",' +
            '"DNK",' +
            '"FRA",' +
            '"LUX",' +
            '"NLD",' +
            '"POL",' +
            '"CHE"' +
        '],' +
        '"nativeName": "Deutschland",' +
        '"numericCode": "276",' +
        '"currencies": [' +
            '{' +
                '"code": "EUR",' +
                '"name": "Euro",' +
                '"symbol": "€"' +
            '}' +
        '],' +
        '"languages": [' +
            '{' +
                '"iso639_1": "de",' +
                '"iso639_2": "deu",' +
                '"name": "German",' +
                '"nativeName": "Deutsch"' +
            '}' +
        '],' +
        '"translations": {' +
            '"br": "Alemanha",' +
            '"de": "Deutschland",' +
            '"es": "Alemania",' +
            '"fa": "آلمان",' +
            '"fr": "Allemagne",' +
            '"hr": "Njemačka",' +
            '"it": "Germania",' +
            '"ja": "ドイツ",' +
            '"nl": "Duitsland",' +
            '"pt": "Alemanha"' +
        '}, ' +
        '"flag": "https://restcountries.eu/data/deu.svg", ' +
        '"regionalBlocs": [ ' +
            '{ ' +
                '"acronym": "EU", ' +
                '"name": "European Union" ' +
            '} ' +
        '],' +
        '"cioc": "GER"}]');
        res.setStatusCode(200);
        return res;
    }
}
