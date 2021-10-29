({
	loadContacts :function(component, event, helper) {
        var action = component.get("c.contobjct");
        
            action.setCallback(this,function(a){
            component.set("v.optionses",a.getReturnValue());	
            });
    $A.enqueueAction(action);
	}
})