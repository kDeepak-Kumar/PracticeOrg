({
    init: function (component, event, helper) {
        helper.initHelper(component, event, helper);
    },
    
    getAccountId : function (component,event,helper){
        var account = event.getParam('row');
        component.set('v.selectedRowAcc',account.Id);
        console.log('Checking Seleced Row::'+component.get('v.selectedRowAcc'));
        var contact = component.get("c.contactRecords");
        contact.setParams({"accId": account.Id});
        contact.setCallback(this,function(response){
            var state = response.getState();
            console.log('contact State:: '+ state);
            if(state==='SUCCESS'){
                component.set('v.Concolumns',[
                    {label: ' Name', fieldName: 'Name', type: 'text'},
                    {label: 'Phone', fieldName: 'Phone', type: 'string'},
                    {label: 'Email', fieldName: 'Email', type: 'text'},
                    {label: 'Description', fieldName: 'Description', type: 'text'},
                ]);
                    var conResult = response.getReturnValue();
                    if(conResult.length  > 0){
                    component.set("v.showConRecords", true);
                    component.set("v.conData",response.getReturnValue());
                    }else {
                    console.log('No Contact records');
                    component.set("v.showConRecords", false);
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                    "title": "No Contacts",
                    "message": "There are No associated Contacts to the Account Selected"
                    });
                    resultsToast.fire();
                    }
                    }
                    });
                    $A.enqueueAction(contact);
                    },
                    
                    onNext : function(component, event, helper) {        
                    var pageNumber = component.get("v.currentPageNumber");
                    component.set("v.currentPageNumber", pageNumber+1);
                    helper.buildData(component, helper);
                    },
                    onPrev : function(component, event, helper) {        
                    var pageNumber = component.get("v.currentPageNumber");
                    component.set("v.currentPageNumber", pageNumber-1);
                    helper.buildData(component, helper);
                    },
                    
                    processMe : function(component, event, helper) {
                    component.set("v.currentPageNumber", parseInt(event.target.name));
                    helper.buildData(component, helper);
                    },
                    
                    onFirst : function(component, event, helper) {        
                    component.set("v.currentPageNumber", 1);
                    helper.buildData(component, helper);
                    },
                    
                    onLast : function(component, event, helper) {        
                    component.set("v.currentPageNumber", component.get("v.totalPages"));
                    helper.buildData(component, helper);
                    },
                    
                    closeModel : function (component){
                    component.set("v.showConRecords", false);
                    }
                    })