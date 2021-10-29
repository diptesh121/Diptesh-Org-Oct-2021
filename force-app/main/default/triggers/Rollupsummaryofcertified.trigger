/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 06-28-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   06-28-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger Rollupsummaryofcertified on Contact (after insert,after update,after delete) {
    
    List<Id> sAccId = new List<Id>();
    if(trigger.IsInsert || trigger.Isupdate){
    for(Contact con: trigger.new){
        if(con.AccountId!=null){
            sAccId.add(con.AccountId); 
            system.debug('--sAccId--'+sAccId);
        }
    }
    }
    if(trigger.Isdelete){
    for(Contact con: trigger.old){
        if(con.AccountId!=null){
            sAccId.add(con.AccountId); 
            system.debug('--sAccId-- delete'+sAccId);
        }
    }
    }
    
    List<Account> acct = [SELECT Total_Technical_Associate_Certified__c,Total_Technical_Advanced_Certified__c,
                          Total_Sales_Associate_Certified__c FROM Account WHERE Id IN:sAccId];
    List<Account> actnt = new List<Account>();
    system.debug('---acct---'+acct);
    List<Contact> cont = [SELECT AccountId,Technical_Associate_Certified__c,
                          Technical_Advanced_Certified__c,Sales_Associate_Certified__c
                          FROM Contact WHERE Id IN:Trigger.New]; 
    system.debug('---cont---'+cont);
     
    
    for(contact cont : Trigger.new) {
        for(Account acc : acct){
            if(trigger.isInsert){
                if(cont.Technical_Associate_Certified__c==TRUE){  
                    if(acc.Total_Technical_Associate_Certified__c==null ){
                        acc.Total_Technical_Associate_Certified__c=1;  
                    }
                    else 
                    { 
                        acc.Total_Technical_Associate_Certified__c = acc.Total_Technical_Associate_Certified__c +1 ;
                    }
                }
                if(cont.Technical_Advanced_Certified__c==TRUE){ 
                    if(acc.Total_Technical_Advanced_Certified__c==null){
                        acc.Total_Technical_Advanced_Certified__c=1;   
                    } 
                    else 
                    acc.Total_Technical_Advanced_Certified__c = acc.Total_Technical_Advanced_Certified__c +1; 
                    
                }
                if(cont.Sales_Associate_Certified__c==TRUE){ 
                    if(acc.Total_Sales_Associate_Certified__c==null){
                        acc.Total_Sales_Associate_Certified__c=1;
                    } 
                    else 
                    acc.Total_Sales_Associate_Certified__c = acc.Total_Sales_Associate_Certified__c +1; 
                }
            } 
            if(trigger.isUpdate){
                Contact oldvalue= Trigger.oldMap.get(cont.Id);
                if(cont.Technical_Associate_Certified__c==TRUE && oldvalue.Technical_Associate_Certified__c==FALSE){    
                    acc.Total_Technical_Associate_Certified__c = acc.Total_Technical_Associate_Certified__c+1;
                    system.debug(' update acc.Total_Technical_Associate_Certified__c ---'+acc.Total_Technical_Associate_Certified__c );
                }  
                if(cont.Technical_Advanced_Certified__c==TRUE && oldvalue.Technical_Advanced_Certified__c==FALSE){ 
                    acc.Total_Technical_Advanced_Certified__c = acc.Total_Technical_Advanced_Certified__c +1; 
                }
                if(cont.Sales_Associate_Certified__c==TRUE && oldvalue.Sales_Associate_Certified__c==FALSE){ 
                    acc.Total_Sales_Associate_Certified__c = acc.Total_Sales_Associate_Certified__c +1; 
                }  
                if(oldvalue.Technical_Associate_Certified__c==TRUE && cont.Technical_Associate_Certified__c==FALSE){    
                    acc.Total_Technical_Associate_Certified__c = acc.Total_Technical_Associate_Certified__c-1; 
                    system.debug(' update remove  acc.Total_Technical_Associate_Certified__c ---'+acc.Total_Technical_Associate_Certified__c );
                    
                }  
                if(oldvalue.Technical_Advanced_Certified__c==TRUE && cont.Technical_Advanced_Certified__c==FALSE){ 
                    acc.Total_Technical_Advanced_Certified__c = acc.Total_Technical_Advanced_Certified__c -1; 
                }
                if(oldvalue.Sales_Associate_Certified__c==TRUE && cont.Sales_Associate_Certified__c==FALSE){ 
                    acc.Total_Sales_Associate_Certified__c = acc.Total_Sales_Associate_Certified__c -1; 
                }
            }
            if(trigger.Isdelete){
             Contact oldvaluedelete = Trigger.oldMap.get(cont.Id);
                system.debug('---oldvaluedelete---'+oldvaluedelete);
  				if(oldvaluedelete.Technical_Associate_Certified__c==TRUE ){    
                    acc.Total_Technical_Associate_Certified__c = acc.Total_Technical_Associate_Certified__c-1; 
                     system.debug(' delete remove  acc.Total_Technical_Associate_Certified__c ---'+acc.Total_Technical_Associate_Certified__c );
                }  
                if(oldvaluedelete.Technical_Advanced_Certified__c==TRUE ){ 
                    acc.Total_Technical_Advanced_Certified__c = acc.Total_Technical_Advanced_Certified__c-1; 
                }
                if(oldvaluedelete.Sales_Associate_Certified__c==TRUE ){ 
                    acc.Total_Sales_Associate_Certified__c = acc.Total_Sales_Associate_Certified__c -1; 
                }
            }
        }  
    
        update acct;
        system.debug('---actnt---'+acct);
    }
    
}