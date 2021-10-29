({
	showToast : function(component, event, helper) {
    alert('Inside Show Toast');
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": "The record has been updated successfully."
    });
    toastEvent.fire();
    }
})