public class BatchMain implements Database.Batchable<sObject>{
    String query;

    public BatchMain(){
        query = 'SELECT Id, Name, WaitingTime__c, (SELECT Id, Name, Size__c FROM Files__r ORDER BY Size__c ASC), Priority__c FROM Client__c';
    }

    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
  
    public void execute(Database.BatchableContext BC, List<sObject> scope){
        List<Client__c> clientList = (List<Client__c>) scope;

        for(Client__c client : clientList){
            client.WaitingTime__c++;
        }

        update clientList;
    }
  
    public void finish(Database.BatchableContext BC){
        DateTime startTime = System.Now();
        while(System.Now() < startTime.addseconds(3)) {}
        
        Config__c conf = [
            SELECT Id, isSystemActive__c
            FROM Config__c
            LIMIT 1
        ][0];

        if(conf.isSystemActive__c){
            Database.executeBatch(new BatchMain());
        }
    }
}