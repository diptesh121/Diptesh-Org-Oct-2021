public class LoginDataapexclass {
    @AuraEnabled
    public static List<Worktask__c> getAllTask(){
        return[SELECT id,Name,Details__c,Quated_Duration__c,Actual_time_taken__c,Task_Status__c FROM Worktask__c 
               WHERE Task_Status__c='Active'OR Task_Status__c='Pending'];
    }
    @AuraEnabled
    public static void updateAccount(List<Worktask__c> acc ){
        update acc;
    }
    @AuraEnabled
    public static List<String> getIndustry(){
        List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = Worktask__c.Task_Status__c.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        return options;
    }
     @AuraEnabled
    public static Login_History__c createAccount(Login_History__c ac){
        insert ac;
        return ac;
    }
    
}