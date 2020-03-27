public with sharing class BrasilIoDatasetService {

    private BrasilIoDatasetRepository dataSetRepository;
    private BrasilIoDatasetProxy proxy;
    private BrasilIoDatasetTransformer transformer;
    private CovidCaseRepository covidCaseRepository;

    public BrasilIoDatasetService() {
        this.dataSetRepository = new BrasilIoDatasetRepository();
        this.proxy = new BrasilIoDatasetProxy();
        this.transformer = new BrasilIoDatasetTransformer();
        this.covidCaseRepository = new CovidCaseRepository();
    }

    public List<Covid_Case__c> findCovidCases() {

        List<Covid_Case__c> covidCases = covidCaseRepository.findTodayCases();

        if ( !covidCases.isEmpty() ) return covidCases;

        BrasilIoDataset__mdt datasetConfig = dataSetRepository.findByName ( 'COVID19' );

        proxy.buildRequest ( datasetConfig.Method__c, datasetConfig.Specific_URL__c );

        Object response = proxy.send();

        String escapedSingleQuotes = response.toString();

        escapedSingleQuotes = escapedSingleQuotes.replace ( '\'', '' );

        CovidCaseResponse covidCaseResponse = (CovidCaseResponse) JSON.deserialize ( escapedSingleQuotes, CovidCaseResponse.class );

        covidCases = transformer.toSfObject ( covidCaseResponse );

        insert covidCases;

        return covidCases;

    }


}