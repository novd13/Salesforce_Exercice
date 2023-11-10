@isTest
private class UpdateCountriesBatchTest {
  @testSetup
  static void setup() {
    Country__c country = new Country__c();
    country.Name = 'TestName';
    country.alpha3Code__c = 'TST';
    country.alpha2Code__c = 'TS';
    country.Capital_City__c = 'Testia';
    country.Region__c = 'Testregia';
    insert country;
  }
  @isTest
  static void testBatchExecution() {
    List<CountryDTO> testCountries = new List<CountryDTO>();

    Test.setMock(HttpCalloutMock.class, new CountryApiServiceMock());

    Test.startTest();

    UpdateCountriesBatch batch = new UpdateCountriesBatch();
    Database.executeBatch(batch);
    Test.stopTest();

    List<Country__c> countries = [
      SELECT
        Id,
        Name,
        Alpha3code__c,
        Alpha2code__c,
        Capital_City__c,
        Region__c,
        RegionalBlocs_Acronym__c
      FROM Country__c
    ];

    System.assertEquals('Afghanistan', countries[0].Name);
    System.assertEquals('TST', countries[0].Alpha3code__c);
    System.assertEquals('AF', countries[0].Alpha2code__c);
    System.assertEquals('Kabul', countries[0].Capital_City__c);
    System.assertEquals('SAARC,', countries[0].RegionalBlocs_Acronym__c);
    System.assertEquals('Asia', countries[0].Region__c);
    System.assertEquals(2, countries.size());
  }
}
