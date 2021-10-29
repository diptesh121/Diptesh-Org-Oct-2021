({
    dosave : function(component, event, helper) {
        var action =component.get("c.createContact");
        var contactList = component.get("v.contactList");
        action.setParams({'contobj':component.get('v.contactobj')});
        action.setCallback(this,function(data){
            component.set('v.contactId',data.getReturnValue());
            contactList.splice(0,0,component.get('v.contactobj'));
            component.set("v.contactList",contactList)
        });
        $A.enqueueAction(action);
    },
    showContacts: function(component, event, helper){
        var action =component.get("c.retrivecontacts");
        action.setCallback(this,function(data){
            //alert(data.getState());
            component.set('v.contactList',data.getReturnValue())
        });
         $A.enqueueAction(action);
    }
})