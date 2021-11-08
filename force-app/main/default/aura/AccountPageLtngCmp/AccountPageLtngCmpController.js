({
    handleClick: function(component, event, helper) {
        var value=component.get("v.language");
        var action = component.get("c.fetchAccount")
        action.setParams({  searchKeyWord : value  });
        action.setCallback(this, function(response){
            var state = response.getState();
            var result = response.getReturnValue();
            if(state === 'SUCCESS'){
                component.set("v.SearchResults", result);
            }
        })
        $A.enqueueAction(action);
    }
})