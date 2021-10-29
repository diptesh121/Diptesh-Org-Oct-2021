trigger FileAttachamentVersion on ContentVersion (after insert) {
   /* Set<Id> contentDocumentIdSet = new Set<Id>();
    
    for(ContentVersion cv:trigger.new){
        if(cv.ContentDocumentId != null) {
            contentDocumentIdSet.add(cv.ContentDocumentId);
            system.debug('cv.id-------'+cv.id);
            
            
            
           //ContentVersion cvv= [SELECT id,VersionData FROM ContentVersion WHERE id =:cv.id];
           //system.debug('cvv.Version-------'+cvv.VersionData);
        }
        
    }
    system.debug('contentDocumentIdSet---'+contentDocumentIdSet);
    List<ContentDocument> cd = [Select id,ParentId from ContentDocument where Id IN:contentDocumentIdSet];
    system.debug('cd--'+cd[0].ParentId);
    List<ContentDocumentLink> cdl = [SELECT Id, LinkedEntityId, ContentDocumentId, Visibility FROM ContentDocumentLink where ContentDocumentId IN:contentDocumentIdSet];
    system.debug('cdl--'+cdl);
    
    for(ContentDocumentLink c : cdl){
        SYSTEM.debug('c.LinkedEntityId---'+c.LinkedEntityId);
        File_Attachment_Table__c fat= new File_Attachment_Table__c();
        fat.File_Id__c = c.ContentDocumentId;
        fat.Master_details_to_Opportunity__c = c.LinkedEntityId;        
        insert fat;
    }*/
}