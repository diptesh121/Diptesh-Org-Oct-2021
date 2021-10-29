public class ContactController1 {
	 @AuraEnabled
    public static Contact createContact(Contact contact){
        upsert contact;
        return contact;
    }
}