public class AccountUtility {
public static void viewAnnualRevenue(){
    List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
 		for(Account acc : accountsList){
        string acctRev = 'Account Name:' + acc.Name + 'Annual revenue:' + acc.AnnualRevenue ;
        system.debug(acctRev);
    }
}
}