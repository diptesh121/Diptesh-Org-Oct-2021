trigger interview on Interview__c (before insert, before update) {
    for(Interview__c interv :Trigger.new){
        
         if(interv.Interview_Stage__c=='Screening'){
            List <Employee_Data__c> trnee =  [SELECT id, name FROM Employee_Data__c WHERE Designation__c= 'Trainee' limit 1];
            for(Employee_Data__c scrn : trnee){
                interv.Screening_Interviewer__c = scrn.id;
            }
             
        }
        if(interv.Technical_Interviewer__c==null && interv.Screening_Result__c=='Pass' && interv.Interview_Stage__c=='Screening'){
            List <Employee_Data__c> intr =  [SELECT id, name FROM Employee_Data__c WHERE Designation__c= 'Manager' limit 1];
            for(Employee_Data__c empa : intr){
                interv.Technical_Interviewer__c = empa.id;
                    interv.Interview_Stage__c ='Technical Round';
            }
        }
        if(interv.Managerial_Interviewer__c==null && interv.Technical_Round_results__c=='Pass' && interv.Interview_Stage__c=='Technical Round'){
            List <Employee_Data__c> CEOemply =  [SELECT id, name FROM Employee_Data__c WHERE Designation__c= 'CEO' limit 1];
            for(Employee_Data__c man : CEOemply){
                interv.Managerial_Interviewer__c = man.id;
                interv.Interview_Stage__c ='Managerial Round';
                 }
            }
            if(interv.HR_Interviewer__c==null && interv.Managerial_Round_result__c=='Pass'&& interv.Interview_Stage__c=='Managerial Round'){
            List <Employee_Data__c> emplyHR =  [SELECT id, name FROM Employee_Data__c WHERE Designation__c= 'HR' limit 1];
            for(Employee_Data__c hrrund : emplyHR){
                interv.HR_Interviewer__c = hrrund.id;
                interv.Interview_Stage__c ='HR Round';  
            }
        }
        if(interv.Managerial_Round_result__c=='Pass'&& interv.Screening_Result__c=='Pass' && interv.Technical_Round_results__c=='Pass' && interv.HR_Round_Result__c=='Pass'){
          interv.Interview_Stage__c ='Interview Cleared ';  
        }
    
}
}