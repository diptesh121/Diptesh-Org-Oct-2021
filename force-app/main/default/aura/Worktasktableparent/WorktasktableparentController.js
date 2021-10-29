({
	initRecords : function(component, event, helper) {
		         var action = component.get("c.fetchworktask");
             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log(JSON.stringify(storeResponse));
               // set AccountList list with return value from server.
                  component.set("v.worktsklist", storeResponse);
            }
        });
        $A.enqueueAction(action);
    },
	Save: function(component, event, helper) {
        if (helper.requiredValidation(component, event)){
               var action = component.get("c.Saveworktask");
                  action.setParams({
                    'lstOftask': component.get("v.worktsklist")
                  });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var storeResponse = response.getReturnValue();
                    component.set("v.worktsklist", storeResponse);
                    // Hide the save and cancel buttons by setting the 'showSaveCancelBtn' false 
                    component.set("v.showSaveCancelBtn",false);
                    alert('Updated...');
                }
            });
            $A.enqueueAction(action);
        } 
    },
    
    cancel : function(component,event,helper){
       // on cancel refresh the view (This event is handled by the one.app container. It’s supported in Lightning Experience, the Salesforce app, and Lightning communities. ) 
        $A.get('e.force:refreshView').fire(); 
    },
    showModel: function(component, event, helper) {
      component.set("v.showModal", true);
   },
     closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.showModal", false);
   },
})