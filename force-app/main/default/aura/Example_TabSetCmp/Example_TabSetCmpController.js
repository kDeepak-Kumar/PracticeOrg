({
    init: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'Account Name', fieldName: 'Name', type: 'Text'},
            {label: 'Phone', fieldName: 'Phone', type: 'Integer'},
            {label: 'Industry', fieldName: 'Industry', type: 'picklist'},
            {label: 'Rating', fieldName: 'Rating', type: 'picklist'}
        ]);
        
        var accRecords = component.get("c.accRecords");
        accRecords.setCallback(this,function(response){
            var state = response.getState();
            console.log('state::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                //console.log('Result::'+JSON. stringify(result));
                component.set("v.data",result);
            }
        });
        $A.enqueueAction(accRecords);
    },
    updateSelectedText: function (component, event) {
        var selectedRows = event.getParam('selectedRows');
        component.set('v.selectedRowsCount', selectedRows.length);
    },
    
    create : function(component,event){
        var lastName = component.find("lName").get("v.value");
        var firstName = component.find("fName").get("v.value");
        var phone = component.find("phone").get("v.value");
        var email = component.find("email").get("v.value");
        console.log('retreived Data');
        var action =  component.get("c.createContact");
        action.setParams({"lName":lastName,"fName":firstName,"phone":phone,"email":email});
        action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State::'+state);
            if(state==='SUCCESS'){
                var result = response.getReturnValue();
                console.log('Result::'+result);
                component.set("v.result",result);
                
            }
        });
        $A.enqueueAction(action);
    },
    
    cancel:function(component){
                
    },
    
    next :function(component){
        //var res = component.get("v.navigation");
        component.set("v.navigation",'two');
    },
    
    prev:function(component){
        component.set("v.navigation",'one');
    },
    
    done:function(component){
        alert('end of last Tab');
    }
    
})