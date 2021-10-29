({
    handleSubmit : function (component, event, helper) {
        var fields = event.getParam("fields");
        component.find("editForm").submit(fields);
    },
    gettimenow :function (component, event, helper){
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        var time = (today.getHours()) + ":" + today.getMinutes() + ":" + today.getSeconds();
        var dateTime = date+' '+time;
        component.set("v.startDatetime", time);
        component.set("v.startDate", date);
        component.set("v.columns",[
            {label: 'Name', fieldName: 'Name', type: 'text' , editable: true},
            {label: 'Quoted Duration', fieldName: 'Quated_Duration__c', type: 'Number' , editable: true},
            {label: 'Details', fieldName: 'Details__c', type: 'text' , editable: true},
            {label: 'Actual time taken', fieldName: 'Actual_time_taken__c', type: 'Number' , editable: true},
            {label: 'Status', fieldName:'Task_Status__c',type: 'List' , editable: true}
        ]),
            alert("dateTime"+dateTime);
        helper.fetchData(component,event, helper);
        
    },
    getlogouttime :function (component, event, helper){
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        var time = (today.getHours()) + ":" + today.getMinutes() + ":" + today.getSeconds();
        var dateTime = date+' '+time;
        component.set("v.EndDatetime", time);
        alert("dateTime"+time);
    },
    handleSuccess: function (cmp, event, helper) {
        cmp.set('v.columns',[
            {label: 'Id', fieldName: 'Id', type: 'text' , editable: false},
            {label: 'Name', fieldName: 'Name', type: 'text' , editable: true},
            {label: 'Quoted Duration', fieldName: 'Quated_Duration__c', type: 'Number' , editable: true},
            {label: 'Details', fieldName: 'Details__c', type: 'text' , editable: true},
            {label: 'Actual time taken', fieldName: 'Actual_time_taken__c', type: 'Number' , editable: true}
        ]),
            helper.fetchData(cmp,event, helper);
    },
    handleSaveEdition: function (cmp, event, helper) {
        var draftValues = event.getParam('draftValues');
        console.log(draftValues);
        var action = cmp.get("c.updateAccount");
        action.setParams({"acc" : draftValues});
        action.setCallback(this, function(response) {
            var state = response.getState();
            $A.get('e.force:refreshView').fire();
            
        });
        $A.enqueueAction(action);
        
    },
    doSave : function(component, event, helper) {
        var action = component.get("c.createAccount");
        action.setParams({
            ac : component.get("v.createAcc")
        });
        action.setCallback(this,function(result){
            var getAllValue = component.get("v.createAcc");
            var state = result.getState();
            if(state === "SUCCESS") {
                helper.showToast(component,event,helper); 
            }
         });
        $A.enqueueAction(action);
    },
   
})