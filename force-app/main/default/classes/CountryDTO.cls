public class CountryDTO {
  public String name { get; set; }
  public String alpha2Code { get; set; }
  public String alpha3Code { get; set; }
  public String capital { get; set; }
  public String region { get; set; }
  public List<RegionalBloc> regionalBlocs { get; set; }

  public class RegionalBloc {
    public String acronym { get; set; }
    public String name { get; set; }
  }
}
