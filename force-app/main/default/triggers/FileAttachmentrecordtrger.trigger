trigger FileAttachmentrecordtrger on File_Attachment_Table__c (after insert) {
    
    List<id> oppId = new List<id>();
    /*List<File_Attachment_Table__c> ParentData = [SELECT Id, Name,File_Id__c,Master_details_to_Opportunity__c,Status__c FROM File_Attachment_Table__c
                                                 WHERE id in :trigger.New];
    system.debug('ParentData---'+ParentData);
    for(File_Attachment_Table__c getOpID : ParentData){
       
        
        oppId.add(getOpID.Master_details_to_Opportunity__c);
    }
    system.debug('oppId'+oppId);
    List<Opportunity> opt = [SELECT Id,Name FROM Opportunity WHERE id IN : oppId];
    for(File_Attachment_Table__c newtrger :trigger.new)
    {
        for(Opportunity oppp :opt){
            if(newtrger.Master_details_to_Opportunity__r.Id== oppp.Id){
                if(oppp.StageName=='Closed Won'){
                    newtrger.Status__c='Complate';
                    }
                update newtrger;
            } system.debug('newtrger---'+newtrger);
        }
    }*/
}