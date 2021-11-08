({
	helperMethod : function(component,helper) {
		var action = component.get("c.accRecords");
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State ::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                console.log('Result');
                component.set("v.data",result);
            }
        });
        $A.enqueueAction(action);
	}
})