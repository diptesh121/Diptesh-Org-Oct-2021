({
    packItem : function(component, event, helper) {
        component.set("v.item.Packed__c",true); // it got added mistakenly in my previous comment. Not required.
        var cItem = component.get("v.item",true); // Getting the component's attribute
        cItem.Packed__c = true; // Assigning the field value to True
        component.set("v.item",cItem); // Setting the attribute back to component
        var btnClicked = event.getSource(); //Getting the button 
        btnClicked.set("v.disabled","true"); // Setting the button to disabled.
    }
})