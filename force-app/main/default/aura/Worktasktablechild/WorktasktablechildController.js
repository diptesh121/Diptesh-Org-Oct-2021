({
     doInit: function(component, event, helper) {
     helper.fetchPickListVal(component, 'Task_Status__c', 'statusPicklistOpts');
    },
    
    inlineEditName : function(component,event,helper){   
        component.set("v.nameEditMode", true); 
        setTimeout(function(){ 
            component.find("inputId").focus();
        }, 100);
    },
     onNameChange : function(component,event,helper){ 
        // if edit field value changed and field not equal to blank,
        // then show save and cancel button by set attribute to true
        if(event.getSource().get("v.value").trim() != ''){ 
            component.set("v.showSaveCancelBtn",true);
        }
    },
     onstatusChange : function(component,event,helper){ 
        // if picklist value change,
        // then show save and cancel button by set attribute to true
        component.set("v.showSaveCancelBtn",true);
    },    
        closeNameBox : function (component, event, helper) {
      // on focus out, close the input section by setting the 'nameEditMode' att. as false   
        component.set("v.nameEditMode", false); 
      // check if change/update Name field is blank, then add error class to column -
      // by setting the 'showErrorClass' att. as True , else remove error class by setting it False   
        if(event.getSource().get("v.value").trim() == ''){
            component.set("v.showErrorClass",true);
        }else{
            component.set("v.showErrorClass",false);
        }
    },
    closeRatingBox : function (component, event, helper) {
       // on focus out, close the input section by setting the 'ratingEditMode' att. as false
        component.set("v.statusEditMode", false); 
    },
    
    inlineEdittaskstatus : function(component,event,helper){   
        // show the rating edit field popup 
        component.set("v.statusEditMode", true); 
        // after set ratingEditMode true, set picklist options to picklist field 
        component.find("accRating").set("v.options" , component.get("v.statusPicklistOpts"));
        // after the 100 millisecond set focus to input field   
        setTimeout(function(){ 
            component.find("accRating").focus();
        }, 100);
    },
     AddNewRow : function(component, event, helper){
       // fire the AddNewRowEvt Lightning Event 
        component.getEvent("addnewrow").fire();     
    },
    
    removeRow : function(component, event, helper){
     // fire the DeleteRowEvt Lightning Event and pass the deleted Row Index to Event parameter/attribute
       component.getEvent("deleterow").setParams({"indexVar" : component.get("v.rowIndex") }).fire();
    }, 
})