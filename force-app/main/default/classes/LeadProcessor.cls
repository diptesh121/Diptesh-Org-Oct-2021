global class LeadProcessor implements Database.Batchable <SObject> {
//START METHOD
    global Database.QueryLocator start(Database.BatchableContext bc){
        string Query ='Select id,Leadsource from Lead';
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead l:scope){
            l.Leadsource='Dreamforce';
        }
        update scope;
    } global void finish(Database.BatchableContext bc){
        Id job= bc.getJobId();
        System.debug(job);
    }
}