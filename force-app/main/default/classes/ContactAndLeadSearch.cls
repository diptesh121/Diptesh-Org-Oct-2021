public class ContactAndLeadSearch {
    public static List<list<SObject>> searchContactsAndLeads(string str)
    {
        List<List<sObject>> searchList = [FIND :str IN ALL FIELDS RETURNING Contact(FirstName,LastName) ,Lead(FirstName,Lastname)];
        return searchList;        
    }
}