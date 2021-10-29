trigger Opportunitycourse on Opportunity (after insert,after update) {
liceanceexpiry  st = new liceanceexpiry();
database.executeBatch(st);
    
  /*  Map<Id, List<Opportunity>> acctIdOppoListMap = new Map<Id, List<Opportunity>>();
    Set<Id> acctIds = new Set<Id>();
    List<Opportunity> oppoList = new List<Opportunity>(); 
    try{
        if(trigger.isUpdate || trigger.isInsert){
            for(Opportunity oppo : trigger.New){
                if(oppo.StageName=='Closed won'|| oppo.AccountId != null){
                    acctIds.add(oppo.AccountId);
                }
            }
        }
        if(acctIds.size() > 0){
            oppoList = [SELECT Course__c, AccountId,StageName FROM Opportunity WHERE AccountId IN : acctIds];
            for(Opportunity oppo : oppoList){
                if(!acctIdOppoListMap.containsKey(oppo.AccountId)){
                    acctIdOppoListMap.put(oppo.AccountId, new List<Opportunity>());
                }
                acctIdOppoListMap.get(oppo.AccountId).add(oppo);
            }
            List<Account> acctList = new List<Account>();
            acctList = [SELECT Course__c FROM Account WHERE Id IN: acctIds];
            for(Account acct : acctList){
                Set<String> courseSet = new Set<String>();
                List<Opportunity> tempOppoList = new List<Opportunity>();
                tempOppoList = acctIdOppoListMap.get(acct.Id);
                for(Opportunity oppo : tempOppoList){
                    if(oppo.StageName=='Closed won'){
                        if(acct.Course__c != null){                            
                            String cs;
                            List<String> courseList = new List<String>();
                            courseList = oppo.Course__c.split(';') ; 
                            system.debug('courseList---'+courseList);
                            
                            for(String s : courseList){
                                if(!acct.Course__c.Contains(s)){
                                    system.debug('beofre acct.Course__c---'+acct.Course__c);
                                    acct.Course__c= acct.Course__c+';'+s;  
                                    system.debug('AF acct.Course__c---'+acct.Course__c);
                                }
                            }                            
                        }else{
                            acct.Course__c = oppo.Course__c;
                        }                   
                    }
                }
                update acctList;
            }
        }
    }catch(exception e){
        system.debug('Error---'+e.getMessage()+'Line number---'+e.getLineNumber());        
    }*/
}