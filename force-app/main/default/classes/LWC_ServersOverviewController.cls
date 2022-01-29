public without sharing class LWC_ServersOverviewController {
    
    @AuraEnabled
    public static String getAllServers(){
        try {
            List<Server__c> servers = [
                SELECT Id, Name, ClientId__c, ClientId__r.Name, FileId__c, FileId__r.Name, FileId__r.Size__c, FileProcessed__c, isActive__c
                FROM Server__c
                ORDER BY Name
            ];

            return JSON.serialize(servers);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}