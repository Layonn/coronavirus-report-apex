public with sharing class CovidCaseResult {

    public String city {get;set;}
    public String city_ibge_code {get;set;}
    public Integer confirmed {get;set;}
    public Double confirmed_per_100k_inhabitants {get;set;}
    //public String date {get;set;}
    public Double death_rate {get;set;}
    public Integer deaths {get;set;}
    public Integer estimated_population_2019 {get;set;}
    public Boolean is_last {get;set;}
    public String place_type {get;set;}
    public String state {get;set;}

}