({
	init: function (component, event, helper) {
        helper.loadSObject(component,helper,event);
        
    },
    
    doSomething : function(component,event,helper){
        var selected = component.find('select').get('v.value');
        console.log('Selected Sobject::'+selected);
        var action = component.get("c.getFieldapis");
        action.setParams({'SobjectName':selected});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State ::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                console.log('Result::'+result);
                component.set("v.fields",result);
            }
        });
        $A.enqueueAction(action);
    }
})