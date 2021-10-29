public class Worktaskrecords {
 @AuraEnabled
    public static List <Worktask__c> getWorktask(){
        List <Worktask__c> worklist =[Select Name,Project1__c,Quated_Duration__c,Task_Status__c,Details__c FROM Worktask__c];
        return worklist;
    }
}