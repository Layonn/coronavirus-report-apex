public with sharing class BrasilIoDatasetTransformer {

    public List<Covid_Case__c> toSfObject ( CovidCaseResponse response ) {

        List<Covid_Case__c> covidCases = new List<Covid_Case__c>();

        if ( response.results.isEmpty() ) return covidCases;

        for ( CovidCaseResult result : response.results ) {

            Covid_Case__c covidCase = new Covid_Case__c();
            covidCase.City__c = result.city;
            covidCase.City_IBGE_Code__c = result.city_ibge_code;
            covidCase.Confirmed__c = result.confirmed;
            covidCase.Confirmed_Per_100k_In_Habitants__c = result.confirmed_per_100k_inhabitants;
            covidCase.Death_Rate__c = result.death_rate;
            covidCase.Deaths__c = result.deaths;
            covidCase.Estimated_Population_2019__c = result.estimated_population_2019;
            covidCase.Is_Last__c = result.is_last;
            covidCase.State__c = result.state;

            covidCases.add ( covidCase );

        }

        return covidCases;

    }

}