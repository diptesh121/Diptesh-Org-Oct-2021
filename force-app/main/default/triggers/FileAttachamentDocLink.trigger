trigger FileAttachamentDocLink on ContentDocumentLink (after insert) {
    
    for(ContentDocumentLink cdl: Trigger.New){
        if(String.valueOf(cdl.LinkedEntityId).startsWith('006')){
            File_Attachment_Table__c fat= new File_Attachment_Table__c();
            fat.File_Id__c = cdl.ContentDocumentId;
            fat.Master_details_to_Opportunity__c = cdl.LinkedEntityId;        
            insert fat; 
            system.debug('fat---'+fat);
        }
        
        system.debug('cdl---'+cdl);
    }
}