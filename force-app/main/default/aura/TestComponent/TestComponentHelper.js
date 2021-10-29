({
	helperAdditionMethod : function(component, event) {
			var firstNumber = parseInt(component.get("v.fNumber"));
   		var secondnumber = parseInt(component.get("v.sNumber"));
          var addition =component.get("c.getAdditionResults");
        addition.setParams({"fstNumber":firstNumber,"secNumber":secondnumber});
        addition.setCallback(this,function(response){
            var addResult = response.getReturnValue();
            //alert(addResult);
            component.set("v.result",addResult);
        });
        
        $A.enqueueAction(addition);
	}
})