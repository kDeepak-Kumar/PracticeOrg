({
	onSearchClickHelper : function(component, event, helper) {
		var value = component.get("v.ShowNew");
        if(value){
            component.set("v.ShowNew",false);
        }else{
            component.set("v.ShowNew",true);
        }        
	},
    
    InitHelper : function(component, event, helper){
        var action = component.get("c.getCarTypesRecordsmethod");
        action.setCallback(this, function(response){
            var state = response.getState();
            //var result = response.getReturnValue();
            if(state === 'SUCCESS'){
        		component.set("v.CarTypes",response.getReturnValue());        
            }else{
                alert('Unkown Error');
            }
        });
        $A.enqueueAction(action);
    }
})