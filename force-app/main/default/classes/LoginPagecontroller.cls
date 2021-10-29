public class LoginPagecontroller {
    @AuraEnabled
    public static Login_History__c createAccount(Login_History__c ac){
        upsert ac;
        system.debug('ac'+ac);
        return ac;
    }
      @AuraEnabled
    public static List<Worktask__c> getClosePlans(){
        return [SELECT id,Name,Actual_time_taken__c,Details__c,Quated_Duration__c,Task_Status__c From Worktask__c];
            }

}