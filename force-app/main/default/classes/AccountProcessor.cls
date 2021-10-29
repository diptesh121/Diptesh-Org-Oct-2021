public class AccountProcessor {
@future
    public static void countContacts(Set<id> setId)
    {
        List <Account> lstAccount =[SELECT id,Number_of_Contacts__c ,(select id from contacts ) FROM Account WHERE id in:setid];
        for(Account acc:lstAccount)
        {
            List<Contact> lstcont = acc.contacts;
            acc.Number_of_Contacts__c=lstcont.size();
        }
        update lstAccount;
    }
}