trigger ClosedOpportunityTrigger on Opportunity (after insert , after update) {
    list<task> TaskToadd = new list<task>();
    for (Opportunity opp: trigger.new)
    {
        if (opp.StageName =='Closed Won'){
            task t = new task();
            t.whatID = opp.id; 
            t.Subject='Follow Up Test Task';
            TaskToadd.add(t);
        }
    }
    if(TaskToadd.size() > 0){
        database.insert(TaskToadd);
    }
}