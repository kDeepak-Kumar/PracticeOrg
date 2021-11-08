({
    createAcc : function(component, event, helper) {
        //helper.helperMethod(component,event,helper);
        
        var accRec = component.get("v.acc");
        var action = component.get("c.createAccRec");
        action.setParams({'acc':accRec});
        action.setCallback(this,function(response){
            var state =  response.getState();
            console.log('State::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                console.log('Response for Account::'+JSON.stringify(result));
                component.set("v.accRecId",result);
            }
        });
        $A.enqueueAction(action);
        
        
        
        /*var accRecEvt = component.getEvent("accEvent");
        accRecEvt.setParams({
            "accRecordId" : accId
        });
        accRecEvt.fire();  */
    },
    
    show : function(component,event){
        var accId = component.get("v.accRecId");
            console.log(' checking accId::'+accId);
        
		var accRecEvt = component.getEvent("accEvent");
        accRecEvt.setParams({
            "accRecordId" : accId,
            "flagEvt" : true
        });
        accRecEvt.fire();

        
        /*var flag = component.getEvent("accEvent");
        flag.setParams({
            "flagEvt" : true });
        flag.fire(); */
    }
})