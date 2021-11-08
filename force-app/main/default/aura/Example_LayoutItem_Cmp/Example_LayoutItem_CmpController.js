({
    init : function(component, event, helper) {
        component.set("v.columns",[
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'View', type: 'button', initialWidth: 135, 
             typeAttributes: { label: 'View Details', name: 'view_details', title: 'Click to View Details'}},
            {label: 'Edit', type: 'button', initialWidth: 135, 
             typeAttributes: { label: 'Edit Details', name: 'edit_details', title: 'Click to Edit Details'}},
        ]);
            helper.helperMethod(component,helper);   
            },
            
     onRowAction : function(component,event){
            var action = event.getParam('action');
            var recId = event.getParam('row');
            component.set("v.recId",recId.Id);
            component.set("v.flag",true);
            if(action.name == 'view_details'){
            	component.set("v.mode",'view');
            console.log('checking view');
            
            }else{
            	component.set("v.mode",'Edit');
            console.log('checking Edit');
            }
      },
            
})