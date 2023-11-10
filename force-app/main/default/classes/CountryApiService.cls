public class CountryApiService {
  public static List<CountryDTO> getCountryData() {
    String apiKey = 'fc985fe8f3f7eb4741794ad0a2fcbc66';
    String apiUrl = 'http://api.countrylayer.com/v2/all?access_key=' + apiKey;
    HttpRequest req = new HttpRequest();
    req.setEndpoint(apiUrl);
    req.setMethod('GET');
    Http http = new Http();
    HttpResponse res = http.send(req);

    List<CountryDTO> countriesDTO = new List<CountryDTO>();
    if (res.getStatusCode() == 200) {
      try {
        countriesDTO = (List<CountryDTO>) JSON.deserialize(
          res.getBody(),
          List<CountryDTO>.class
        );
      } catch (Exception e) {
        System.debug(
          'CountryApiService JSON.deserialization error: ' + e.getMessage()
        );
      }
      return countriesDTO;
    } else {
      System.debug('API Request Error. Status Code: ' + res.getStatusCode());
      System.debug('API Response Body: ' + res.getBody());
      return countriesDTO;
    }
  }
}
