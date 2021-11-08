({
    init: function (component, event, helper) {
        component.set('v.columns',[
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Description', fieldName: 'Description__c', type: 'Text Area'},
            {label: 'Edit', type: 'button',  typeAttributes:
             { label: { fieldName: 'actionEdit'}, title: 'Click to Edit', name: 'edit', iconName: 'action:edit', disabled: {fieldName: 'actionDisabled'}, class: 'btn_next'}},
            {label: 'Delete', type: 'button',  typeAttributes:
             { label: { fieldName: 'actionEdit'}, title: 'Click to delete', name: 'delete', iconName: 'action:delete', disabled: {fieldName: 'actionDisabled'}, class: 'btn_next'}},
            {label: 'Action', type: 'button', typeAttributes: { label: 'Add Sobject', name: 'sObject', title: 'Click to Associate to Sobject', iconName: 'utility:add'}},
        ]);
            var action = component.get('c.roleRecord');
            action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State Value::'+state);
            if(state==='SUCCESS'){
            console.log('Result');
            component.set("v.data", response.getReturnValue());
            }
            });
            $A.enqueueAction(action);
            
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
            },
            
            createNewRole : function(component,event,helper){
            component.set("v.createRole",true);
            },
            
            rowAction : function(component, event,helper){
            var role = event.getParam('row');
            component.set('v.roleId',role.Id);
            var buttonClicked = event.getParam('action');
            if(buttonClicked.name === 'edit'){
            component.set("v.editRole",true);
            
            }else if(buttonClicked.name === 'delete'){
            component.set("v.deleteRole",true);
            }else {
            component.set("v.addSobject",true);
            }
            },
            
            closeModel : function(component){
            component.set("v.editRole", false);
            component.set("v.deleteRole", false);
            component.set("v.addSobject", false);
            component.set("v.createRole",false);
            },
            
            closedeleteModel : function(component){
            component.set("v.deleteRole", false);
            },
            
            closeSobjectModel : function(component){
            component.set("v.addSobject", false);
            },
            
            deleteRecord : function(component,event, helper){
            var rId = component.get("v.roleId");
            console.log('RoleId'+rId);
            var action = component.get('c.deleteRoleRecord');
            action.setParams({"roleRId":rId});
            action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State response::'+state);
            if(state==='SUCCESS'){
            console.log('success for delete block');
            alert('Record Deleted Succesfully');
            $A.get('e.force:refreshView').fire();
            component.set("v.deleteRole", false);
            }
            });
            $A.enqueueAction(action);
            },
            
            handleChange: function (component, event) {
            //Get the Selected values   
            var selectedValues = event.getParam("value");
            
            //Update the Selected Values  
            component.set("v.selectedGenreList", selectedValues);
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
            var selectOptions = [];
                      result.forEach(function(item){
            selectOptions.push({value:item, label:item});
        }, this);
        component.set("v.ApiFields", selectOptions); //should return a list of strings of the picklist values 
    } else {
    console.log('Lead Status: ' + state);
}
 });
$A.enqueueAction(action);
},
    saveFields : function(component,event){
        //Get selected Genre List on button click 
        var selectedValues = component.get("v.selectedGenreList");
        console.log('Selectd Genre-' + selectedValues);
    } 

})