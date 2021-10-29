public class PickListUtilcls {
	@Auraenabled
    public static List<Contact> contobjct()
    {
         return [SELECT id,name FROM Contact Limit 15];
               
    } 
    
}