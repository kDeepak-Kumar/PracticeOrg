({
	loadSObject: function (component,helper,event) {
        console.log('entered helper method');
        var sObject = component.get("c.getobjNames");
        sObject.setCallback(this,function(response){
            var state = response.getState();
            console.log('State ::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                //console.log('Result::'+result);
                component.set("v.options",result);
            }
        });
        $A.enqueueAction(sObject);
        
    }
})