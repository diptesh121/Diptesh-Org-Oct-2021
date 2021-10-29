/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-29-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   06-29-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
public class FirstClass {
 public static void firstmethod()
    {
             Expense__c st= new Expense__c(Expense_Price__c=125,Expense_description__c='Hello');
              system.debug(st);
              system.debug(st);
    }
}