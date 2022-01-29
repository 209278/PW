import { api, LightningElement, track } from 'lwc';

//Apex
import addFile from '@salesforce/apex/LWC_ClientButtonsController.addFile';

export default class LwcClientButtons extends LightningElement {
    @api
    clientId

    @track
    fileName = "";

    handleAddFileClick(){
        if(this.fileName.length > 0){
            addFile({ clientId: this.clientId, fileName: this.fileName })
                .then(result =>{
                    this.dispatchEvent(new CustomEvent('refresh'));
                })
                .catch(error =>{
                    console.log(error);
                });
        }
    }

    handleValueChange(event){
        this.fileName = event.target.value;
    }
}