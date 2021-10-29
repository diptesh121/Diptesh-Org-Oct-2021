public class ContactAura {
    @AuraEnabled
    public static List<contact> get10COntacts(){
        return[SELECT Id, FirstName,LastName,Birthdate FROM Contact LIMIT 5];
            }
	
    @AuraEnabled
    public static  List<contact> updateContact(List<contact> get10Contacts2 ){
        try{
            update get10Contacts2;
        }
        catch(exception e){
            system.debug('Fail'+e);
        }
        system.debug('get10Contacts2'+get10Contacts2);
        return get10Contacts2;
        
        }
}