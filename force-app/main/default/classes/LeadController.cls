public with sharing class LeadController {
  public static void UpdateCountryFields(List<Lead> leads) {
    Map<String, Country__c> nameCountryMap = new Map<String, Country__c>();
    Set<String> countryNames = new Set<String>();
    for (Lead lead : leads) {
      countryNames.add(lead.Country);
    }
    List<Country__c> countries = [
      SELECT
        Id,
        Alpha2Code__c,
        Alpha3Code__c,
        Capital_City__c,
        Name,
        Region__c,
        RegionalBlocs_Acronym__c
      FROM Country__c
      WHERE Name IN :countryNames
    ];

    for (Country__c country : countries) {
      nameCountryMap.put(country.Name, country);
    }
    for (Lead leadToUpdate : leads) {
      Country__c leadCountry = nameCountryMap.get(leadToUpdate.Country);
      if (leadCountry != null) {
        if (
          leadToUpdate.Country_alpha2Code__c == null ||
          leadCountry.Alpha2Code__c != leadToUpdate.Country_alpha2Code__c
        ) {
          leadToUpdate.Country_alpha2Code__c = leadCountry.Alpha2Code__c;
        }
        if (leadCountry.alpha3Code__c != leadToUpdate.Country_Alpha3Code__c) {
          leadToUpdate.Country_Alpha3Code__c = leadCountry.alpha3Code__c;
        }
        if (
          leadCountry.Capital_City__c != leadToUpdate.Country_Capital_City__c
        ) {
          leadToUpdate.Country_Capital_City__c = leadCountry.Capital_City__c;
        }
        if (leadCountry.Region__c != leadToUpdate.Country_Region__c) {
          leadToUpdate.Country_Region__c = leadCountry.Region__c;
        }
        if (
          leadCountry.RegionalBlocs_Acronym__c !=
          leadToUpdate.Country_RegionalBlocs_Acronym__c
        ) {
          leadToUpdate.Country_RegionalBlocs_Acronym__c = leadCountry.RegionalBlocs_Acronym__c;
        }
      }
    }
  }
}
