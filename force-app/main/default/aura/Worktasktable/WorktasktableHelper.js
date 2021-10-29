({
	worktskhelper : function(component, event, helper) {
		component.set('v.columns',[
            {label:'Name',fieldName:'Name',type:'text'},
            {label:'Project',fieldName:'Project1__c',type:'text'},
            {label:'Quoted Duration',fieldName:'Quated_Duration__c',type:'Number'},
            {label:'Task Status',fieldName:'Task_Status__c',type:'text'},
            {label:'Details',fieldName:'Details__c',type:'text'},
        ]);
            var action = component.get("c.getWorktask");
            action.setParams({});
            action.setCallback(this,function(response){
            var state = response.getState();
            if(state=="SUCCESS"){
            component.set("v.data",response.getReturnValue());
            
            }
            });
            $A.enqueueAction();
	}
})