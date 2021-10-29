public class AccountRecordsctrl {
@Auraenabled
    public static List<Account> getAccounts(){
        return [select id,name from account limit 50];
    }
    @Auraenabled
    public static List<Account> getAccountRecords(String objname,String fields){
        return database.query('select id,'+fields+' from'+objname+'where leadSource!=null ');
    }
}