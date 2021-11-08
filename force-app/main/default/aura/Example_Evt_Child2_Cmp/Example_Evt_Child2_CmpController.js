({
	createCon : function(component, event, helper) {
		var conRec = component.get("v.con");
        var action = component.get("c.createConRec");
        action.setParams({'con':conRec});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                console.log('Contact Record Id::'+JSON.stringify(result));
                component.set("v.conRecId",result);
            }
        });
        $A.enqueueAction(action);
        
	},
    
    show : function(component,event){
        var conId = component.get("v.conRecId");     
        var conRecEvent = component.getEvent("conEvent");
        conRecEvent.setParams({
            "flagEvt" : true,
            "conRecordId" :conId
        });
        conRecEvent.fire(); 
    }
})