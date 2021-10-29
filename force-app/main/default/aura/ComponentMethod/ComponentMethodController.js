({
	retrieveAccounts : function(component, event, helper) {
		var params =event.getParam('arguments');
        var Actcallback;
        if(params) {
            Actcallback =params.callback;
        }
        var action = component.get("c.getAccountRecords");
        action.setParams({objname:params.objectName,fields:params.fieldName});
        action.setCallback(this,function(response){
            var records = response.getReturnValue();
            Actcallback(records);
        });
        $A.enqueueAction(action);
    }
})