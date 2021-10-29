/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-29-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountHandler {
public static Account insertNewAccount(String name) {
Account a = new Account();
a.Name = name;
System.debug('sada');
try
{
insert a;
} catch (Exception e) {
return null; 
}
return a;

}
}    