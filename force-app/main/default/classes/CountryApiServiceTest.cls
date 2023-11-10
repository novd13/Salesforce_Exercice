@isTest
private class CountryApiServiceTest {

    @isTest
    static void testGetCountryData() {
        Test.setMock(HttpCalloutMock.class, new CountryApiServiceMock());
        List<CountryDTO> countryData = CountryApiService.getCountryData();
        System.assertNotEquals(null, countryData, 'Country data should not be null');
    }
}
