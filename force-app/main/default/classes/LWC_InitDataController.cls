public with sharing class LWC_InitDataController {
    
    @AuraEnabled
    public static void init(){
        try {
            List<Config__c> conf = [
                SELECT Id
                FROM Config__c
            ];

            delete conf;

            Config__c newConfig = new Config__c(Name = 'Conf');
            insert newConfig;

            List<File__c> files = [
                SELECT Id
                FROM FIle__c
            ];

            delete files;

            List<Client__c> clients = [
                SELECT Id
                FROM Client__c
            ];

            delete clients;

            List<Server__c> servers = [
                SELECT Id
                FROM Server__c
            ];

            delete servers;

            List<Server__c> serversToInsert = new List<Server__c>();

            serversToInsert.add(new Server__c(Name = 'Server1'));
            serversToInsert.add(new Server__c(Name = 'Server2'));
            serversToInsert.add(new Server__c(Name = 'Server3'));
            serversToInsert.add(new Server__c(Name = 'Server4'));
            serversToInsert.add(new Server__c(Name = 'Server5'));

            insert serversToInsert;

            List<Client__c> clientsToInsert = new List<Client__c>();

            clientsToInsert.add(new Client__c(Name = 'Client1', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client2', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client3', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client4', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client5', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client6', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client7', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client8', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client9', WaitingTime__c = 0));
            clientsToInsert.add(new Client__c(Name = 'Client10', WaitingTime__c = 0));

            insert clientsToInsert;

            List<File__c> filesToInsert = new List<File__c>();

            for(Client__c client : clientsToInsert){
                Integer randomNumber1 = Integer.valueof((math.random() * 10));
                Integer numberOfFiles = Math.mod(randomNumber1,3) + 1;
                for(Integer i = 0; i < numberOfFiles; i++){
                    Integer randomNumber = Integer.valueof((math.random() * 10));
                    filesToInsert.add(new File__c(Name='File' + (i+1) + '_' + client.Name, Size__c = Math.mod(randomNumber,60) + 1, ClientId__c = client.Id));
                }
            }

            insert filesToInsert;

            // List<File__c> filesToInsert = new List<File__c>();

            // //client1
            // filesToInsert.add(new File__c(Name='File1_Client1', Size__c = 20));
            // filesToInsert.add(new File__c(Name='File2_Client1', Size__c = 10));
        
            // //client2
            // filesToInsert.add(new File__c(Name='File1_Client2', Size__c = 5));
            // filesToInsert.add(new File__c(Name='File2_Client2', Size__c = 10));
            // filesToInsert.add(new File__c(Name='File3_Client2', Size__c = 10));

            // //client3
            // filesToInsert.add(new File__c(Name='File1_Client3', Size__c = 30));

            // //client4
            // filesToInsert.add(new File__c(Name='File1_Client4', Size__c = 20));

            // //client5
            // filesToInsert.add(new File__c(Name='File1_Client5', Size__c = 5));

            // //client6
            // filesToInsert.add(new File__c(Name='File1_Client6', Size__c = 5));
            // filesToInsert.add(new File__c(Name='File2_Client6', Size__c = 15));
            // filesToInsert.add(new File__c(Name='File3_Client6', Size__c = 30));

            // //client7
            // filesToInsert.add(new File__c(Name='File1_Client7', Size__c = 5));
            // filesToInsert.add(new File__c(Name='File2_Client7', Size__c = 50));

            // //client8
            // filesToInsert.add(new File__c(Name='File1_Client8', Size__c = 10));
            // filesToInsert.add(new File__c(Name='File2_Client8', Size__c = 20));

            // //client9
            // filesToInsert.add(new File__c(Name='File1_Client9', Size__c = 50));

            // //client10
            // filesToInsert.add(new File__c(Name='File1_Client10', Size__c = 20));

            // insert filesToInsert;

            // List<Client__c> clientsToInsert = new List<Client__c>();

            // for(File__c file : filesToInsert){
            //     if(file.Name.contains('Client10')){
            //         clientsToInsert.add(new Client__c(Name = 'Client10', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client2')){
            //         clientsToInsert.add(new Client__c(Name = 'Client2', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client3')){
            //         clientsToInsert.add(new Client__c(Name = 'Client3', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client4')){
            //         clientsToInsert.add(new Client__c(Name = 'Client4', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client5')){
            //         clientsToInsert.add(new Client__c(Name = 'Client5', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client6')){
            //         clientsToInsert.add(new Client__c(Name = 'Client6', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client7')){
            //         clientsToInsert.add(new Client__c(Name = 'Client7', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client8')){
            //         clientsToInsert.add(new Client__c(Name = 'Client8', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client9')){
            //         clientsToInsert.add(new Client__c(Name = 'Client9', FileId__c = file.Id, WaitingTime__c = 0));
            //     } else if(file.Name.contains('Client1')){
            //         clientsToInsert.add(new Client__c(Name = 'Client1', FileId__c = file.Id, WaitingTime__c = 0));
            //     }
            // }

            // insert clientsToInsert;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}