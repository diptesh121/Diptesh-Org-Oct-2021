public with sharing class worktasktableclass {
    //method for fetch Worktask data
    @AuraEnabled
    public static List<Worktask__c> fetchworktask(){
        List < Worktask__c > returnList = new List < Worktask__c > ();
        List<Worktask__c> lstOftask = [Select Id, Name, Actual_time_taken__c,Details__c,Quated_Duration__c,Task_Status__c FROM Worktask__c];
        for(Worktask__c acc:lstOftask){
            returnList.add(acc);
        }
        return returnList;
    }
    
    //Method for update 
    @AuraEnabled
    public static List<Worktask__c> Saveworktask(List<Worktask__c> lstOftask){
        update lstOftask;
        return lstOftask;
    }
    
    // method for fetch picklist values dynamic  
    @AuraEnabled
    public static List<String> getselectOptions (sObject objObject, string fld){
        List < String > allOpts = new list < String > ();
        Schema.sObjectType objType = objObject.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        list < Schema.PicklistEntry > values =
            fieldMap.get(fld).getDescribe().getPickListValues();
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());
        }
            allOpts.sort();
            return allOpts;
        }
}