public with sharing class CovidCaseResponse {

    public Integer count {get;set;}
    public String next {get;set;}
    public String previous{get;set;}
    public List<CovidCaseResult> results{get;set;}

}