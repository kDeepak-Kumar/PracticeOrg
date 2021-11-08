({
	onLoad : function(component, event, helper) {
		helper.helperMethod(component, event);
	},
    
    NewRecordformButton : function(component, event, helper) {
        component.set("v.ToShowOppRecForm",true)
    },
    
    handleComponentEvent : function(component, event, helper) {
        var message = event.getParam("toShowVar");
        // set the handler attributes based on event data
        component.set("v.ToShowOppRecForm", message);        
        helper.helperMethod(component, event);
    }
})