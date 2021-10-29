({
	callAuraMethodServerTrip : function(component, event, helper) {
		var Childcmp = component.find("child");
        Childcmp.retrieveAccounts(function(result){
            console.log("callback for aura:method was executed");
            console.log("result"+result);
            var records=[];
            alert(result);
            component.set("v.accountRecords",result);
            alert(component.get("v.accountRecords"));
        },'Contact','Name');
	}
})