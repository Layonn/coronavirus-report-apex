public with sharing class CovidCaseRepository {

    public List<Covid_Case__c> findTodayCases() {
        return [SELECT City__c, City_IBGE_Code__c, Confirmed__c, Confirmed_Per_100k_In_Habitants__c, Death_Rate__c
                , Deaths__c, Estimated_Population_2019__c, Is_Last__c, State__c FROM Covid_Case__c WHERE CreatedDate = TODAY ];
    }
}