({
    doInit : function(component, event, helper) {
        component.set('v.mycolumns',[
            {   label: 'Id', fieldName: 'Id', type: 'text'},
            {   label: 'First Name', fieldName: 'FirstName', type: 'text' ,editable: true},
            {   label: 'Last Name', fieldName: 'LastName', type: 'text' ,editable: true, typeAttributes: { required: true }},
		    {   label: 'Birthdate', fieldName: 'Birthdate', type: 'Date',editable: true,
             typeAttributes: {
                 year: 'numeric',
                 month: 'numeric',
                 day: 'numeric',
             }},
                        {type: "button", typeAttributes: {
                label: 'View',
                name: 'View',
                title: 'View',
                disabled: false,
                value: 'view',
                iconPosition: 'left'
            }},
            {type: "button", typeAttributes: {
                label: 'Edit',
                name: 'Edit',
                title: 'Edit',
                disabled: false,
                value: 'edit',
                iconPosition: 'left'
            }}
        ]);
            helper.getAllContacts2(component, event, helper);
            },
    
  onSave  : function( component, event, helper ) {
            var draftValues = event.getParam('draftValues');
            console.log('draftValues is :'+draftValues);
            var action= component.get("c.updateContact");
            action.setParams({"get10Contacts2" :draftValues});
            action.setCallback(this,function(response){
            var state= response.getState();
            if (state === "SUCCESS") {
            var res = response.getReturnValue();
            component.set("v.contactRowstable",response.getReturnValue());

            console.log('var res is:'+response.getReturnValue());
            alert('get10Contacts2'+res);
            $A.get('e.force:refreshView').fire();
            }
            });
             $A.enqueueAction(action);
        },
            
            /*page refresh after data save*/
     isRefreshed: function(component, event, helper) {
        location.reload();
    },
    viewRecord : function(component, event, helper) {
        var recId = event.getParam('row').Id;
        var actionName = event.getParam('action').name;
        if ( actionName == 'Edit') {
            alert('Edit');
            var editRecordEvent = $A.get("e.force:editRecord");
            editRecordEvent.setParams({
                "recordId": recId
            });
            editRecordEvent.fire();
        } else if ( actionName == 'View') {
            alert('view');
            var viewRecordEvent = $A.get("e.force:navigateToURL");
            viewRecordEvent.setParams({
                "url": "/" + recId
            });
            viewRecordEvent.fire();
        }
    }                      
                           
})