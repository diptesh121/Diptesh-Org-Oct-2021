trigger Interview_Stage on Interview_Stage__c (before update,before insert,after update,after insert) {
    if(Trigger.isinsert && Trigger.isbefore){
        for(Interview_Stage__c beinsrt : Trigger.new){
            if(beinsrt.Interview_Stage__c=='Screening'){
                List <Employee_Data__c> trne = [SELECT id, name FROM Employee_Data__c WHERE Designation__c='Trainee' limit 1];
                for(Employee_Data__c scrn : trne){
                    beinsrt.Interviewer__c=scrn.id;
                }
            }
            if(beinsrt.Interview_Stage__c=='Technical Round'|| beinsrt.Interview_Stage__c=='Managerial Round'){
                beinsrt.Live_status__c='Pending';
                List <Employee_Data__c> trneeq = [SELECT id, name FROM Employee_Data__c WHERE Designation__c='Manager' limit 1];
                for(Employee_Data__c scrne : trneeq){
                    beinsrt.Interviewer__c=scrne.id;
                }
            }
            if(beinsrt.Interview_Stage__c=='HR Round'){
                beinsrt.Live_status__c='Pending';
                List <Employee_Data__c> trneet =[SELECT id, name FROM Employee_Data__c WHERE Designation__c='HR' limit 1];
                for(Employee_Data__c scrnf : trneet){
                    beinsrt.Interviewer__c=scrnf.id;
                }
            }
        } 
    }
    if(Trigger.isupdate && Trigger.isbefore){
        for(Interview_Stage__c aftrcan :Trigger.new){
            if(aftrcan.Reschedule_Required__c==True){
                if(aftrcan.Reason_for_Reschedule__c=='Interviewer is Busy'||aftrcan.Reason_for_Reschedule__c=='Candidate is Busy'){
                    aftrcan.Schedule_Date__c=aftrcan.Reshedule__c;  
                    aftrcan.Live_status__c='Active';
                    
                }
                if(aftrcan.Reason_for_Reschedule__c=='Interviewer on Leave'){
                    aftrcan.Live_status__c='Redirected';
                    for(Interview_Stage__c b:Trigger.new){
                        Interview_Stage__c nwstge = new Interview_Stage__c();
                        nwstge.Interview__c=b.Interview__c;
                        nwstge.Interview_Stage__c=b.Interview_Stage__c;
                        nwstge.Live_status__c='Pending';
                        nwstge.Schedule_Date__c=aftrcan.Schedule_Date__c+1;
                        
                        List <Employee_Data__c> trnee =  [SELECT id, name,Designation__c FROM Employee_Data__c];
                        for(Employee_Data__c scrn : trnee){
                            if(nwstge.Interview_Stage__c=='Technical Round'|| nwstge.Interview_Stage__c=='Managerial Round' ){
                                if(scrn.Designation__c=='Manager'){
                                    nwstge.Interviewer__c=scrn.id;
                                    nwstge.Live_status__c='Pending';
                                }
                            }
                            if(nwstge.Interview_Stage__c=='HR'){
                                if(scrn.Designation__c=='HR'){
                                    nwstge.Interviewer__c=scrn.id;
                                    nwstge.Live_status__c='Pending';
                                }
                            }
                            if(nwstge.Interview_Stage__c=='Screening'){
                                if(scrn.Designation__c=='Trainee'){
                                    nwstge.Interviewer__c=scrn.id;
                                    nwstge.Live_status__c='Pending';
                                }
                            }
                        } 
                        insert nwstge;        
                    } 
                }
                
            }
        } 
    }   
    if(Trigger.isupdate && Trigger.isbefore){
        for(Interview_Stage__c newint :Trigger.new){
            if(newint.Conclusion__c=='Interview Cleared'||newint.Conclusion__c=='Repeat' ){
                newint.Live_status__c='Completed';
                for(Interview_Stage__c c:Trigger.new){
                    Interview_Stage__c newintervw = new Interview_Stage__c();
                    newintervw.Interview__c= c.Interview__c;
                    newintervw.Live_status__c='Pending';
                    newintervw.Schedule_Date__c=newint.Schedule_Date__c+1;
                    if(newint.Interview_Stage__c=='Screening'){
                        newintervw.Interview_Stage__c='Technical Round';
                    }
                    if(newint.Interview_Stage__c=='Technical Round'){
                        newintervw.Interview_Stage__c='Managerial Round';
                    }
                    if(newint.Interview_Stage__c=='Managerial Round'){
                        newintervw.Interview_Stage__c='HR Round';
                    }
                    if(newint.Repeat_Interview__c=='Technical Round'){
                        newintervw.Interview_Stage__c='Technical Round';
                    }
                    if(newint.Repeat_Interview__c=='HR Round'){
                        newintervw.Interview_Stage__c='HR Round';
                    }
                    if(newint.Repeat_Interview__c=='Managerial Round'){
                        newintervw.Interview_Stage__c='Managerial Round';
                    }
                    insert newintervw;
                }
            }
            if(newint.Conclusion__c=='Unqualified'){
                newint.Live_status__c='Completed';
            }
            if(newint.Conclusion__c=='Hold'){
                newint.Live_status__c='Active';
            }   
        }
    }
    if(Trigger.isupdate && Trigger.isbefore)  
    for(Interview_Stage__c mailalrt :Trigger.new){
        system.debug('Inside Loop---'+mailalrt.Interview__r.Candidate__r.EMail__c);
        if(mailalrt.Interview__r.Candidate__r.EMail__c!=null){
                    system.debug('Inside Loop---');
            if(mailalrt.Live_status__c=='Active'){
                system.debug('Date.today()----'+Date.today()+'---mailalrt.Schedule_Date__c---'+mailalrt.Schedule_Date__c);
                if(Date.today()== mailalrt.Schedule_Date__c){    
                    system.debug('Inside if----');
                    Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                    String[] toAddresses = new String[] {'dipteshpipaliya@gmail.com','margish.g@shrumtech.com'}; 
                        mail.setToAddresses(toAddresses);
                    mail.setReplyTo('dipteshpipaliya@gmail.com');
                    mail.setSenderDisplayName('ST Interview');
                    mail.setSubject('Interview Hold for More than 2 Days of   ' +mailalrt.Interview__r.Candidate__r.first_name__c );
                    mail.setPlainTextBody(''+mailalrt.Interview__r.Candidate__r.first_name__c+' '+mailalrt.Interview__r.Candidate__r.first_name__c+ 'Your Interview status is on HOLD for more than 2 days , We have highlighted this issue to the Management');
                    mail.setHtmlBody(''+mailalrt.Interview__r.Candidate__r.first_name__c+' '+mailalrt.Interview__r.Candidate__r.first_name__c+ 'Your Interview status is on HOLD for more than 2 days , We have highlighted this issue to the Management');
                    Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });                        
                }
            }
            }
        }
    }