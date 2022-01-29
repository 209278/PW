import { LightningElement, track, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import REFRESH_ALL from '@salesforce/messageChannel/refreshAll__c';

//Apex
import getAllClients from '@salesforce/apex/LWC_WaitingClientsListController.getAllClients';

export default class LwcWaitingClientsList extends LightningElement {
    @track 
    clients;

    @wire(MessageContext)
    messageContext;

    subscription = null;

    connectedCallback(){
        this.getClients();
        this.subscription = subscribe(
            this.messageContext,
            REFRESH_ALL,
            () => this.refresh()
        );
    }

    getClients(){
        getAllClients()
            .then(result => {
                this.clients = JSON.parse(result);
            })
            .catch(error => {
                console.log(error);
            });
    }

    refresh(){
        console.log('List refersh');
        this.getClients();
    }
}