import { LightningElement, track, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import REFRESH_ALL from '@salesforce/messageChannel/refreshAll__c';

//Apex
import getAllServers from '@salesforce/apex/LWC_ServersOverviewController.getAllServers';

export default class LwcServersOverview extends LightningElement {

    @track 
    servers;

    @wire(MessageContext)
    messageContext;

    subscription = null;

    connectedCallback(){
        this.getServers();

        this.subscription = subscribe(
            this.messageContext,
            REFRESH_ALL,
            () => this.refresh()
        );
    }

    getServers(){
        getAllServers()
            .then(result => {  
                this.servers = JSON.parse(result);
            })
            .catch(error => {
                console.log(error);
            })
    }

    refresh(){
        console.log('Servers refresh');
        this.getServers();
    }
}