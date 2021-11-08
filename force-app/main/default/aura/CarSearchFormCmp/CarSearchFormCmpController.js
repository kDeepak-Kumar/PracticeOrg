({
    doInIt : function(component, event, helper) {
        
        helper.InitHelper(component, event, helper);
        
        //component.set("v.CarTypes",['sports', 'Luxury', 'BMW']);
        var createRecordEvent = $A.get("e.force:createRecord");
        if(createRecordEvent){
            component.set("v.ShowNew",true);
        }else{
            component.set("v.ShowNew",false);
        }
    },
     
    onSearchClick : function(component, event, helper) {
        //helper.onSearchClickHelper(component, event, helper);
        var SearchFormSubmitEvt = component.getEvent("SearchFormSubmit");
        SearchFormSubmitEvt.setParams({
            "CarTypeId" : component.find("CarTypeList").get("v.value")
        });
        SearchFormSubmitEvt.fire();
    },
    
    CreateNewRecord : function(component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Car_Type__c"
        });
        createRecordEvent.fire();
    }
})