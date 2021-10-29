/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-12-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

public class Sobjectandfieldpicklist {
    public map<String,Schema.SObjectType> objmap {set;get;}
    public list <selectoption> objects {set;get;}
    public list <selectoption> fields {set;get;}
    public List<SObject> TableList {get;set;}
    String listfield='';
    public List<String> lststrng{get;private set;}
    public String Selected {set;get;}
    public List<String> selectedfield {set;get;}
    public Date toDatedate { get; set; }
    public Date fromDatedate { get; set; }
    public Date fromdate {
        get {
            Date today = Date.today();
            fromDatedate = today.addMonths(-1);
            System.debug('filterState.fromDatedate---');
            return fromDatedate;
            
        }
        set {
            fromDatedate = value;
            //filterState.fromDate = Date.parse(value);
            
        }
    }
    
    public Date todate {
        get {
            Date today = Date.today();
            toDatedate = today;
            System.debug('filterState.todate---');
            return toDatedate;
        }
        set {
            toDatedate = value;
        }
    }
    public  Sobjectandfieldpicklist (){
        objects = new list <selectoption>();
        fields = new list <selectoption>();
        selectoption n =new Selectoption('None' ,'-None-');
        objects.add(n);
        fields.add(n);
        //fetch all object from the salesforce metedata
        objmap = Schema.getGlobalDescribe();

        // fetch all the object names from the Map
        set<String> keys =objmap.keyset();

        // create a list to Store Object names And store them
        List<String> objnames = new list<String> (Keys);   
        objnames.sort();

        // take one by one objectname and create them  as piklist option
        for(String s : objnames){
            if (s.contains('history')) {
                selectoption op = new selectoption(s,s);
            objects.add(op);
         }
            
        }
    }
    public void getdata(){
        fields.clear();
        lststrng= new List<String>();
        selectoption n =new Selectoption('None' ,'-None-');
        if(selected !='None'){
            schema.SObjectType obj =objmap.get(Selected);   
            //get the description of the give Sobject
            Schema.DescribeSObjectResult result = obj.getDescribe();
            map<String,Schema.SObjectField> fldmap = result.fields.getmap();
            set<String> keys =fldmap.keyset();
            List<String> fldnames = new list<String> (Keys);   
            fldnames.sort();
            for(String s: fldnames){
                Selectoption p = new selectoption(s,s);    
                fields.add(p);
            }
            
        }else{
            fields.add(n);           
            
        }
        for(selectoption so:fields){
            if (listfield==''|| listfield==null) {
                listfield+= so.getvalue();  
            } else{
                listfield+= ',' + so.getvalue();
                 }
            lststrng.add(so.getvalue());
            
        }
    }
    

    public PageReference reset(){
        PageReference pg = new PageReference(System.currentPageReference().getURL());
        pg.setRedirect(true);
        return pg;
    }
    public void runSearch(){
        System.debug('listfield---'+selectedfield);
        System.debug('selected---'+selected);
        string allstring = string.join(selectedfield,',');
       System.debug('allstring--'+allstring);
        TableList = Database.query('Select ' + allstring +  ' from ' + selected + ' where CreatedDate >: fromDatedate and CreatedDate <: toDatedate');
        System.debug('TableList--'+TableList);
    }
    public PageReference runexport(){
        return Page.Datatoexcelforallobject;
    } 
}
   