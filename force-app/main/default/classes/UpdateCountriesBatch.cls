public class UpdateCountriesBatch implements Database.Batchable<CountryDTO>, Schedulable, Database.AllowsCallouts {
  public List<CountryDTO> start(Database.BatchableContext context) {
    return CountryApiService.getCountryData();
  }

  public void execute(
    Database.BatchableContext context,
    List<CountryDTO> countriesDTO
  ) {
    if (countriesDTO != null) {
      Map<String, CountryDTO> alpha3codeToCountryMap = new Map<String, CountryDTO>();
      for (countryDTO countryDTO : countriesDTO) {
        alpha3codeToCountryMap.put(countryDTO.alpha3Code, countryDTO);
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
        WHERE Alpha3Code__c IN :alpha3codeToCountryMap.keyset()
      ];

      if (!countries.isEmpty()) {
        List<Country__c> countriesToUpdate = new List<Country__c>();
        for (Country__c country : countries) {
          Boolean changed = false;
          CountryDTO cDTO = alpha3codeToCountryMap.get(country.alpha3Code__c);
          if (cDTO != null) {
            if (cDTO.name != country.Name) {
              country.name = cDTO.name;
              changed = true;
            }
            if (cDTO.alpha3Code != country.Alpha3Code__c) {
              country.Alpha3Code__c = cDTO.alpha3Code;
              changed = true;
            }
            if (cDTO.alpha2Code != country.Alpha2Code__c) {
              country.Alpha2Code__c = cDTO.alpha2Code;
              changed = true;
            }
            if (cDTO.capital != country.Capital_City__c) {
              country.Capital_City__c = cDTO.capital;
              changed = true;
            }
            if (cDTO.region != country.Region__c) {
              country.Region__c = cDTO.region;
              changed = true;
            }
            if (cDTO.regionalBlocs != null) {
              for (CountryDTO.RegionalBloc regionalBloc : cDTO.regionalBlocs) {
                if (country.RegionalBlocs_Acronym__c == null) {
                  country.RegionalBlocs_Acronym__c =
                    regionalBloc.acronym + ', ';
                  changed = true;
                } else if (
                  !country.RegionalBlocs_Acronym__c.contains(
                    regionalBloc.acronym
                  )
                ) {
                  country.RegionalBlocs_Acronym__c =
                    country.RegionalBlocs_Acronym__c +
                    regionalBloc.acronym +
                    ', ';
                  changed = true;
                }
              }
            }
            if (changed) {
              countriesToUpdate.add(country);
            }
            alpha3codeToCountryMap.remove(country.alpha3Code__c);
          }
        }
        if (!countriesToUpdate.isEmpty()) {
          update countriesToUpdate;
        }
      }
      if (!alpha3codeToCountryMap.isEmpty()) {
        List<Country__c> countriesToCreate = new List<Country__c>();
        for (String key : alpha3codeToCountryMap.keySet()) {
          CountryDTO keyCountryDTO = alpha3codeToCountryMap.get(key);
          Country__c newCountry = new Country__c();
          newCountry.Name = keyCountryDTO.name;
          newCountry.Alpha3Code__c = keyCountryDTO.alpha3Code;
          newCountry.Alpha2Code__c = keyCountryDTO.alpha2Code;
          newCountry.Capital_City__c = keyCountryDTO.capital;
          newCountry.Region__c = keyCountryDTO.region;
          if (keyCountryDTO.regionalBlocs != null) {
            for (
              CountryDTO.RegionalBloc regionalBloc : keyCountryDTO.regionalBlocs
            ) {
              newCountry.RegionalBlocs_Acronym__c =
                newCountry.RegionalBlocs_Acronym__c +
                regionalBloc.acronym +
                ', ';
            }
          }

          countriesToCreate.add(newCountry);
        }
        insert countriesToCreate;
      }
    }
  }

  public void finish(Database.BatchableContext context) {
  }

  public void execute(SchedulableContext sc) {
    Database.executeBatch(this);
  }
}
