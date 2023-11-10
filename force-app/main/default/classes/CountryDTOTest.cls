@isTest
private class CountryDTOTest {
  @isTest
  static void testCountryDTO() {
    CountryDTO dto = new CountryDTO();
    dto.name = 'Test Country';
    dto.alpha2Code = 'TC';
    dto.alpha3Code = 'TST';
    dto.capital = 'Test Capital';
    dto.region = 'Test Region';
    List<CountryDTO.RegionalBloc> regionalblocsList = new List<CountryDTO.RegionalBloc>();
    CountryDTO.RegionalBloc bloc = new CountryDTO.RegionalBloc();
    bloc.acronym = 'RB';
    bloc.name = 'Test Bloc';
    regionalblocsList.add(bloc);
    dto.regionalBlocs = regionalblocsList;
    System.assertEquals('Test Country', dto.name);
    System.assertEquals('TC', dto.alpha2Code);
    System.assertEquals('TST', dto.alpha3Code);
    System.assertEquals('Test Capital', dto.capital);
    System.assertEquals('Test Region', dto.region);
    System.assertEquals('RB', dto.regionalBlocs[0].acronym);
    System.assertEquals('Test Bloc', dto.regionalBlocs[0].name);
  }
}
