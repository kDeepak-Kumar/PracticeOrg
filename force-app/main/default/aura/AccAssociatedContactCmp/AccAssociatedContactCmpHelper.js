({
	helperMethod : function(Ccomponent, event) {
		var action = component.get("c.AccountAssociatedContactMethod");
        action.setCallback(this, function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set("v.ShowContactRecords",result);
            }            
        });
        $A.enqueueAction(action);
	}
})