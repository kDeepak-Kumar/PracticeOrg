({
    handleApplicationEvent : function(component, event, helper) {
        var accountId = event.getParam("accId");
        // set the handler attributes based on event data
        component.set("v.accRecId", accountId);
        var accRecordId = component.get("v.accRecId");
        var action = component.get("c.searchConRec");
        action.setParams({"accId":accRecordId});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('Response from Child2::'+state);
            if(state ==='SUCCESS'){
                var result=response.getReturnValue();
                component.set("v.conRec",result);
            }
        });
        $A.enqueueAction(action);
    }
    
})