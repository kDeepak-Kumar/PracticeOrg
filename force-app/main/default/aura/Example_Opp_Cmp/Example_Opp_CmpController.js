({
    doInIt: function(component, event, helper) {
        component.find("myOpp").getNewRecord(
            'Opportunity',
            null,
            false,
            $A.getCallback(function(){
                var con = component.get("v.newOpp");
                console.log('InIt');
            })
        );
    },
    
    save: function(component, event, helper) {
        component.find("myOpp").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS" || saveResult.state === "DRAFT") {
				console.log('Saved Succesfully');
            }
            console.log('NOT Saved Succesfully');
        }));
    }
})