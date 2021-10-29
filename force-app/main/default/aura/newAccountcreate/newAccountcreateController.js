({
	doInit : function(component, event, helper) {
		var action=component.get ("c.getPickList");
        action.setParams({
            objName : component.get("v.objName"),
            fldName : component.get("v.fldName")
        });
        action.setCallback(this,function(result){
            var ResultValue=result.getReturnValue();
            component.set("v.ratingList",ResultValue);
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
    docancel : function(component, event, helper) {
        component.set("v.createAcc","");
    },
})