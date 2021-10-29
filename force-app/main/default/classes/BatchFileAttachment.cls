global class BatchFileAttachment implements Database.Batchable <SObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        string Query ='SELECT id,File_Id__c,Status__c,Master_details_to_Opportunity__c,Master_details_to_Opportunity__r.StageName FROM File_Attachment_Table__c WHERE Status__c!=\'Complate\' AND Master_details_to_Opportunity__r.StageName = \'Closed Won\'';
        system.debug('----Query--'+Query);
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext bc, List<File_Attachment_Table__c> filerollup){
        system.debug('----filerollup--'+filerollup);
        
        for(File_Attachment_Table__c fil:filerollup){
            
        }
    }
    global void finish(Database.BatchableContext bc){
        Id job= bc.getJobId();
        System.debug(job);
    }
}