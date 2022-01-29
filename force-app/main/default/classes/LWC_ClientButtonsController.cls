public with sharing class LWC_ClientButtonsController {
    @AuraEnabled
    public static void addFile(Id clientId, String fileName){
        try {
            Integer randomNumber = Integer.valueof((math.random() * 10));
            File__c file = new File__c(Name=fileName, Size__c = Math.mod(randomNumber,60) + 1, ClientId__c = clientId);
            insert file;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}