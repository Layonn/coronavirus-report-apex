public with sharing class CovidCasesController {

    @AuraEnabled
    public static String findCovidCases() {

        BrasilIoDatasetService service = new BrasilIoDatasetService();

        List<Covid_Case__c> covidCases = new List<Covid_Case__c>();

        try {

            covidCases = service.findCovidCases();

            return JSON.serialize ( covidCases );

        } catch ( Exception ex ) {

            throw new AuraHandledException ( 'Houve um erro ao buscar os casos' );

        }

    }

}