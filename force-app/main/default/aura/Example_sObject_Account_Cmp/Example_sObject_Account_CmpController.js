({
	create : function(component, event, helper) {
		var accRec = component.get("v.acc");
        var action = component.get("c.createAccRecord");
        action.setParams({'acc':accRec});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State ::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                console.log('Result'+JSON.stringify(result));
                component.set("v.result",result);
            }
        });
        $A.enqueueAction(action);
	}
})