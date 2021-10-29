({
    getAllContacts : function(component, event, helper) {
        var action = component.get("c.get10COntacts");
        action.setCallback(this,function(a){
            component.set("v.contactRows",a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    getAllContacts2 : function(component, event, helper) {	
        var action = component.get("c.get10COntacts");
        action.setCallback(this,function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var data =response.getReturnValue();
                 component.set("v.contactRowstable",data);
            }
        });      
        $A.enqueueAction(action);
    }  
})