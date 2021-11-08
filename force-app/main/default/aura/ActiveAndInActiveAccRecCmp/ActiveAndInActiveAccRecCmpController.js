({
	ActiveRecMethod : function(component, event, helper) {
		var action = component.get("c.ActiveAccountRecords");
        action.setCallback(this,function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set("v.ToShowActiveRecords", true);
                component.set("v.ActiveAccountRecords", result);
            }
        });
        $A.enqueueAction(action);
	},
    InActiveRecMethod : function(component, event, helper) {
		var actionA = component.get("c.InActiveAccountRecords");
        actionA.setCallback(this,function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set("v.ToShowInActiveRecords", true);
                component.set("v.InActiveAccountRecords",result);
            }
        });
        $A.enqueueAction(actionA);
    }
})