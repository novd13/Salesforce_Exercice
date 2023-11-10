@isTest
private class LeadControllerTest {

    @testSetup
  static void setup() {
    List<Country__c> countries = new List<Country__c>();
        for (Integer i = 0; i < 3; i++) {
            countries.add(new Country__c(
                Name = 'Country ' + i,
                Alpha2Code__c = 'A' + i,
                Alpha3Code__c = 'AC' + i,
                Capital_City__c = 'Capital ' + i,
                Region__c = 'Region ' + i,
                RegionalBlocs_Acronym__c = 'RB' + i
            ));
        }
        insert countries;

        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 3; i++) {
            testLeads.add(new Lead(
                FirstName = 'Test' + i,
                LastName = 'Lead' + i,
                Country = 'Country ' + i,
                LeadSource = 'Other',
                Company = 'TestCompany'
            ));
        }
        insert testLeads;
  }
    @isTest
    static void testLeadControllerUpdate() {

        Test.startTest();
        List<Lead> leadsToUpdate = [SELECT Id, Country, Country_alpha2Code__c, Country_Alpha3Code__c, Country_Capital_City__c, Country_Region__c, Country_RegionalBlocs_Acronym__c FROM Lead Limit 4];
        LeadController.UpdateCountryFields(leadsToUpdate);
        Test.stopTest();

        for (Lead lead : leadsToUpdate) {
            Country__c country = [
                SELECT Alpha2Code__c, Alpha3Code__c, Capital_City__c, Region__c, RegionalBlocs_Acronym__c
                FROM Country__c
                WHERE Name = :lead.Country
            ];
            System.assertEquals(country.Alpha2Code__c, lead.Country_alpha2Code__c);
            System.assertEquals(country.Alpha3Code__c, lead.Country_Alpha3Code__c);
            System.assertEquals(country.Capital_City__c, lead.Country_Capital_City__c);
            System.assertEquals(country.Region__c, lead.Country_Region__c);
            System.assertEquals(country.RegionalBlocs_Acronym__c, lead.Country_RegionalBlocs_Acronym__c);
        }
    }
}
