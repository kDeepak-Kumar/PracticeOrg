({
	ContactRecButtonMethod : function(component, event, helper) {
        var ConRec = component.get("c.getContactRecordsMethod");
        ConRec.setCallback(this, function(response){           
            var state = response.getState();
            var responseRply = response.getReturnValue();
            console.log('State ::'+state);
            console.log('Response ::'+JSON.stringify(responseRply));
			component.set("v.ContactRec", responseRply);         
        });
        $A.enqueueAction(ConRec); 
	}
})