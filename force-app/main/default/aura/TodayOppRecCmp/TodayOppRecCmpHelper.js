({
	helperMethod : function(component, event) {
		var action = component.get("c.TodayOppRecMethod");
        action.setCallback(this, function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set("v.TodayCreatedOppRec", result);
            }
        });
        $A.enqueueAction(action);
	}
})