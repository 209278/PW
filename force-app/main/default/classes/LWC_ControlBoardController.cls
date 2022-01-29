public with sharing class LWC_ControlBoardController {
    
    @AuraEnabled
    public static Config__c getConfig(){
        try {
            Config__c conf = [
                SELECT Id, isSystemActive__c
                FROM Config__c
                LIMIT 1
            ];

            return conf;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void runBatch(){
        try {
            Database.executeBatch(new BatchMain());
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}