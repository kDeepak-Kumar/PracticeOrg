({
	onLoad : function(component, event, helper) {
		var action = component.get("c.TodayCreatedLeadsmethod");
        action.setCallback(this, function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set("v.TodayCreateLeadList", result);
            }
        });
        $A.enqueueAction(action);
	},
    
    handleClick : function (component, event, helper) {
        alert("You clicked: " + event.getSource().get("v.label"));
    }
})