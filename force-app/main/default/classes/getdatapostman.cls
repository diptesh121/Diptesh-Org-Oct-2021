@RestResource(urlMapping='/Accountget/*')
global with sharing class getdatapostman {
    
    @HttpGet
    global static List<Account> doGet() {
        Id accountId;
        Set<Id> accIdSet = new Set<Id>();
         List<Account> accList = new List<Account>();
        Map<String,object> accMap = new Map<String,object>();
        RestRequest req = RestContext.request;
       	RestResponse res = RestContext.response;
        List<object> jasonBody = (List<object>)JSON.deserializeUntyped(req.requestBody.toString());
        system.debug('jasonBody---'+jasonBody);
        for(object obj : jasonBody){
            Map<String,Object> data = (Map<String,Object>)obj;
            if (data.containsKey('Id')) {
                accIdSet.add((String)data.get('Id'));
                accountId = (String)data.get('Id');
                system.debug('accountId---'+accountId);
            }
        }
        String Queryfield ='';
        system.debug('accountId===>'+accMap);
        Schema.DescribeSObjectResult a_desc = Account.sObjectType.getDescribe(); 
        //for the Account object, you can replace that with any object you have, standard or custom
        Map<String, Schema.SObjectField> a_fields = a_desc.fields.getMap();
        for(Schema.sObjectField fld:a_fields.values()){ 
            if(Queryfield!=''){
                 Queryfield += ',' + fld;            
            } 
            else {
               Queryfield = ''+ fld;
            }
        }
       String Query= 'SELECT' + ' ' + Queryfield+' FROM Account WHERE Id IN';
        Query += ':accIdSet'; 
                system.debug('Queryfield---'+Query.right(50));

        List<Account> result = Database.query(Query);
        return result;
    }
    
    @HttpPost
    global static List<Account> doPost(){
        String accountId;
        List<Account> acc = new List<Account>();
        Account account;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
		
        Map<String, Object> body = new Map<String, Object>();
        String jsonBody = req.requestBody.toString(); 
        if (!String.isBlank(jsonBody)) {
           List<object> jasonBody = (List<object>)JSON.deserializeUntyped(req.requestBody.toString());
            for(object obj : jasonBody){
                Map<String,Object> data = (Map<String,Object>)obj;
                account = new Account();
                account.Name = (String)data.get('name');
                account.phone = (String)data.get('phone');
                account.website = (String)data.get('website');
                acc.add(account);
             }
         	 insert acc;
         	 }
        return acc;
    }
    public class jsonWrap{
        String Namex;
        String phonex;
        String websitex;
    }
}