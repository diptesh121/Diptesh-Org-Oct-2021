/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-29-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   06-29-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
global class liceanceexpiry implements Database.Batchable <SObject> {
    //START METHOD
    global Database.QueryLocator start(Database.BatchableContext bc){
        string Query ='SELECT id, Licence_expiry_date__c,stagename,AccountId,Course__c FROM Opportunity';
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext bc, List<Opportunity> licanceexpirydate){
        Map<Id, List<Opportunity>> acctIdOppoListMapofexpire = new Map<Id, List<Opportunity>>();
        Set<Id> accexpire = new Set<Id>();
        try{ List<Opportunity> oppoListexpre = new List<Opportunity>(); 
        for(Opportunity l:licanceexpirydate){
            if(l.StageName=='Closed Won' && l.AccountId!=null && l.Licence_expiry_date__c>=System.today()){
                accexpire.add(l.AccountId);
            }
        }
        if(accexpire.size()>0){
            oppoListexpre = [SELECT Course__c, AccountId,StageName,Licence_expiry_date__c FROM Opportunity WHERE AccountId IN : accexpire];
            system.debug('oppoListexpre size-->'+oppoListexpre.size());
            //Looping all oportunities for getting accounts.
            for(Opportunity oppo : oppoListexpre){
                if(!acctIdOppoListMapofexpire.containsKey(oppo.AccountId)){
                    acctIdOppoListMapofexpire.put(oppo.AccountId, new List<Opportunity>());
                }
                acctIdOppoListMapofexpire.get(oppo.AccountId).add(oppo);
            }
            List<Account> acctList = new List<Account>();
            acctList = [SELECT Course__c FROM Account WHERE Id IN: accexpire];
            system.debug('Acccount List size=='+acctList.size());
            for(Account acct : acctList){
                Set<String> courseSet = new Set<String>();
                List<Opportunity> tempOppoList = new List<Opportunity>();
                tempOppoList = acctIdOppoListMapofexpire.get(acct.Id);
                acct.Course__c='';
                for(Opportunity oppo : tempOppoList){
                    if(oppo.StageName=='Closed won'){
                         if(oppo.Licence_expiry_date__c<=System.today()) {
                             system.debug('courseList which is getting removed ---'+oppo.Course__c.split(';'));
                         }
                                                if(oppo.Licence_expiry_date__c > System.today()){
                            system.debug('oppo.AccountId NOT EXPIRED --'+oppo.AccountId);
                            String cst;
                            List<String> courseLst = new List<String>();
                            courseLst = oppo.Course__c.split(';') ; 
                            system.debug('courseLst NOT EXPIRED---'+courseLst);
                            
                            for(String t : courseLst){
                                if(!acct.Course__c.Contains(t)){
                                    system.debug('beofre acctr.Course__c---'+acct.Course__c);
                                    acct.Course__c= acct.Course__c + ';'+ t;
                                }
                            }  
                        }
                    }                       
                }    
            }
            system.debug('Going for update account list');
            update acctList;
            system.debug('DONE update account list');
            system.debug('Deploy');
        }
    }catch(exception e){
        system.debug('Error---'+e.getMessage()+'Line number---'+e.getLineNumber());        
    }
    }
    global void finish(Database.BatchableContext bc){
        Id job= bc.getJobId();
        System.debug(job);
    }
}