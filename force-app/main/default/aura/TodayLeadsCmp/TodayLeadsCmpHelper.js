({
	helperMethod : function(component, event) {
		var action = component.get("C.todayLeadMethod");
        action.setCallback(this, function(response){
            var state = response.getState();
            var leadResult = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set("v.TodayLeadsList",leadResult);
            }
        });
        $A.enqueueAction(action);
	}
})