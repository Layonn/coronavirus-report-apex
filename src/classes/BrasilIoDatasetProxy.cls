public virtual class BrasilIoDatasetProxy {

    private Http http;
    private HttpRequest httpRequest;
    private HttpResponse httpResponse;

    public BrasilIoDatasetProxy() {
        this.http = new Http();
        this.httpRequest = new HttpRequest();
        this.httpResponse = new HttpResponse();
    }

    public void buildRequest ( String method, String url ) {
        httpRequest.setMethod ( method );
        httpRequest.setEndpoint ( url );
        httpRequest.setHeader('Content-Type', 'application/json');
        httpRequest.setHeader('Accept', 'application/json');
    }

    public Object send() {

        try {

            httpResponse = http.send ( httpRequest );

            if ( httpResponse.getStatusCode() != 200 ) return httpResponse.getStatusCode();

            System.debug ( 'UNTYPED: ' + httpResponse.getBody() );

            return httpResponse.getBody();

        } catch ( Exception ex ) {

            System.debug ( 'Houve um erro ao realizar a request - ' + ex.getMessage() + '\n' + ex.getStackTraceString() );
        }

        return '';

    }

}