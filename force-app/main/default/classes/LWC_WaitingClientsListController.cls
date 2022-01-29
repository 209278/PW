public without sharing class LWC_WaitingClientsListController {
    
    @AuraEnabled
    public static String getAllClients(){
        try {
            List<Client__c> clients = [
                SELECT Id, Name, WaitingTime__c, (
                    SELECT Id, Name, Size__c
                    FROM Files__r
                    ORDER BY Size__c ASC
                ),	
                Priority__c
                FROM Client__c
            ];

            return JSON.serialize(clients);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}