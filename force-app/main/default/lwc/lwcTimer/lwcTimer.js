import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import REFRESH_ALL from '@salesforce/messageChannel/refreshAll__c';

export default class LwcTimer extends LightningElement {
    @wire(MessageContext)
    messageContext;

    timeIntervalInstance;

    connectedCallback(){
        var parentThis = this;
        
        this.timeIntervalInstance = setInterval(function() {
            parentThis.sendMessage();
        }, 3000);
    }

    sendMessage(){
        publish(this.messageContext, REFRESH_ALL);
    }
}