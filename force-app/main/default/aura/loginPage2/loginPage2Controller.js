({
    doSave : function(component, event, helper) {
        var action = component.get("c.createAccount");
        alert('doSave Working ');
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
    gettimenow :function (component, event, helper){
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        var time = (today.getHours()) + ":" + today.getMinutes() + ":" + today.getSeconds();
        var dateTime = date+' '+time;
        component.set("v.createAcc.Login_Time__c", dateTime);
 		
    },
      gettimenow2 :function (component, event, helper){
        var today = new Date();
        var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
        var time = (today.getHours()) + ":" + today.getMinutes() + ":" + today.getSeconds();
        var dateTime = date+' '+time;
        component.set("v.createAcc.Logout_Time__c", dateTime);
 		
    },
    doInit: function(component, event, helper) {
        // Fetch the account list from the Apex controller
        helper.getClosePlanList(component);
      },
    initRecords: function(component, event, helper) {
      // call the apex class method and fetch account list  
         var action = component.get("c.getClosePlans");
             action.setCallback(this, function(response) {
              var state = response.getState();
              if (state === "SUCCESS") {
                  var storeResponse = response.getReturnValue();
                  console.log(JSON.stringify(storeResponse));
               // set AccountList list with return value from server.
                  component.set("v.closeplan", storeResponse);
            }
        });
        $A.enqueueAction(action);
    },
})