({
	onLoad : function(component, event, helper) {
        helper.helperMethod(component, event);
	},
    
    handleClick : function(component, event, helper){
        component.set("v.toShowLeadForm",true);
    },
    
    handleComponentEvent : function(component, event, helper){
        var message = event.getParam("isToShowVar");
        // set the handler attributes based on event data
        component.set("v.messageFromEvent", message);
        helper.helperMethod(component, event);
    }
})