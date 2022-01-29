import { LightningElement,track } from 'lwc';
import { updateRecord } from 'lightning/uiRecordApi';

//Apex
import getConfig from '@salesforce/apex/LWC_ControlBoardController.getConfig';
import runBatch from '@salesforce/apex/LWC_ControlBoardController.runBatch';

export default class LwcControlBoard extends LightningElement {
    @track
    config;

    connectedCallback(){
        this.getConf();
    }
    
    getConf(){
        getConfig()
            .then(result => {
                this.config = result;
            })
            .catch(error => {
                console.log(error);
            });
    }

    handleStartClick(){
        this.config.isSystemActive__c = true;
        const fields = {};
        fields['Id'] = this.config.Id;
        fields['isSystemActive__c'] = this.config.isSystemActive__c;
        const recordInput = { fields };
        updateRecord(recordInput);
        runBatch();
    }

    handleStopClick(){
        this.config.isSystemActive__c = false;
        const fields = {};
        fields['Id'] = this.config.Id;
        fields['isSystemActive__c'] = this.config.isSystemActive__c;
        const recordInput = { fields };
        updateRecord(recordInput);
    }
}