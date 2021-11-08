({
	onLoad : function(component, event, helper) {
		helper.helperMethod(component, event);
	},
    
    handleClick : function(component, event, helper) {
        component.set("v.ToShowContactRecForm",true);
    },
    
    handleComponentEvent : function(component, event, helper) {
     	 var message = event.getParam("IstoShowConForm");
        // set the handler attributes based on event data
        component.set("v.ToShowContactRecForm", message);  
        helper.helperMethod(component, event);
    }
})