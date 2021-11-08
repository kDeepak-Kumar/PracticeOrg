({
    /*HandleSaveRecord :function(component,event,helper){
        component.find("recordHandler").saveRecord($A.getCallback(function(saveResult){
            console.log('Handle Save Record Method Executed');
        }));
    },*/
    
    handleRecordUpdated :function(component,event,helper){
        var eventParams = event.getParams();
        if(eventParams.changeType === 'CHANGED'){
            // get the fields that changed for this record
			var ChangedFields = eventParams.changeFields;
            console.log('Fields That are Changed :'+JSON.stringify(ChangedFields));
            var resultToast = $A.get("e.force:showToast");
            resultToast.setParams({
                "title" : "Saved" ,
                "message" : "Record is Updated"
            });
            resultToast.fire();
        }
    }
})