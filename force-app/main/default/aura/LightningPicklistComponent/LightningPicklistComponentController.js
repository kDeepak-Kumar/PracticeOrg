({
     loadRecords : function(component, event, helper) {
        
             
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            
        ]);
            
            var objName=component.get('v.objectName');
            console.log(objName);
            var action=component.get("c.retrieveDetails");
            
            action.setParams({   
            
            
            "sObjectName":objName
            });
            
            
            action.setCallback(this,function(response){
            
            var records = response.getReturnValue();
            console.log(records);
            component.set("v.recordsList",records);
            });
            
          
            $A.enqueueAction(action);
            
              }

})