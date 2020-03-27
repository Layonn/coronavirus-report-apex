public with sharing class BrasilIoDatasetRepository {

    public BrasilIoDataset__mdt findByName ( String configName ) {

        List<BrasilIoDataset__mdt> datasetConfigs = [ SELECT Base_URL__c, Specific_URL__c, Method__c FROM BrasilIoDataset__mdt WHERE DeveloperName = :configName ];

        if ( !datasetConfigs.isEmpty() )return datasetConfigs.get(0);

        return new BrasilIoDataset__mdt ( Base_URL__c = 'https://brasil.io/api/dataset/covid19', Specific_URL__c = 'https://brasil.io/api/dataset/covid19/caso/data' );

    }

}