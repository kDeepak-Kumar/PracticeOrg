({
    searchAcc : function(component, event, helper) {
        var accountName = component.find("accName").get("v.value");
        console.log('Account Name::'+accountName);
        var action = component.get("c.Search");
        action.setParams({"accName":accountName});
        console.log('params set');
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.accId",result);
                var accountID = component.get("v.accId");
                console.log('Account ID ::'+accountID.Id);
                
                component.set("v.flag",true);
                var appEvent = $A.get("e.c:Example_AppEvt");
                appEvent.setParams({
                    "accId" : accountID.Id });
                appEvent.fire();
            }
        });
        $A.enqueueAction(action);
    }
})