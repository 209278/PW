import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

//Apex
import init from '@salesforce/apex/LWC_InitDataController.init';

export default class LwcInitData extends LightningElement {
    handleButtonClick(){
        init()
            .then(result => {
                const evt = new ShowToastEvent({
                    title: "Success",
                    message: "Success",
                    variant: "success",
                });
                this.dispatchEvent(evt);
            })
            .catch(error => {
                const evt = new ShowToastEvent({
                    title: "Error",
                    message: error,
                    variant: "error",
                });
                this.dispatchEvent(evt);
            });
    }
}