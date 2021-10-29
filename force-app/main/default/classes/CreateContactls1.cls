public class CreateContactls1 {
@Auraenabled
    public static string createContact(contact contobj){
        system.debug('contact:'+contobj.FirstName);
        insert contobj;
        return contobj.Id;
    }
    @Auraenabled
    public static List<contact> retrivecontacts(){
        return [SELECT id,FirstName,LastName,email from Contact order by createdDate desc Limit 5];
    }
}