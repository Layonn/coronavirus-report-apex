import { LightningElement, track } from 'lwc';
import findCovidCases from '@salesforce/apex/CovidCasesController.findCovidCases';

export default class CovidCases extends LightningElement {

    @track covidCases
    @track showSpinner

    connectedCallback() {
        this.findCovidCases();
    }

    findCovidCases() {

        this.showSpinner = true;

        findCovidCases({}).then ( response => {
            this.covidCases = JSON.parse ( response );
            console.log ( "COVIDE: " );
            console.dir ( this.covidCases );
            this.showSpinner = false;
        }).catch ( error => {
            this.showSpinner = false;
        });

    }

}