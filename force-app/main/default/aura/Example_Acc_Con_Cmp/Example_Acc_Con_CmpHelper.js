({
    initHelper: function (component, event, helper) {
        component.set('v.columns',[
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'string'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Rating', fieldName: 'Rating', type: 'text'},
            {label: 'Action', type: 'button', initialWidth: 135, typeAttributes: { label: 'Associate', name: 'associate_Contact', title: 'Click to Associate to Contact', iconName: 'utility:add'}},
        ]);
            var action = component.get('c.AccountRecords');
            action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State Value::'+state);
            if(state==='SUCCESS'){
            console.log('Response Time: '+((new Date().getTime())-requestInitiatedTime));
            console.log('Result');
            component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
            component.set("v.allData", response.getReturnValue());
            component.set("v.currentPageNumber",1);
            helper.buildData(component, helper);
            }
            });
            var requestInitiatedTime = new Date().getTime();
            $A.enqueueAction(action);
            
            // Assigning Contact record to Attribute
            var cId = component.get("v.ContactId");
            var contact = component.get("c.ContactRecord");
            contact.setParams({"conId":cId});
            contact.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
            var result = response.getReturnValue();
            component.set("v.contact",result);
            }
            });
            $A.enqueueAction(contact);
            
            },
            
            Update : function (component,event,helper){
            //var accId = event.getParam('row');
            var accId = component.get('v.selectedRowAcc');
            var contactId = component.get("v.contact.Id");
            console.log('contact Id ::'+contactId);
            console.log('Account Name ::'+accId.Name);
            var updatedConAccId = component.get("c.updateContact");
            updatedConAccId.setParams({"accId": accId , "ConId": contactId });
            updatedConAccId.setCallback(this,function(response){
            var state = response.getState();
            console.log('state for Update:'+state);
            if(state === 'SUCCESS'){
            console.log('Updating state Success');
            component.set('v.contact', response.getReturnValue());
            var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was updated."
                });
                resultsToast.fire();
            }
            });
            $A.enqueueAction(updatedConAccId);
            },
            
            /*
     * this function will build table data
     * based on current page selection
     * */
            buildData : function(component, helper) {
            var data = [];
                      var pageNumber = component.get("v.currentPageNumber");
        var pageSize = component.get("v.pageSize");
        var allData = component.get("v.allData");
        var x = (pageNumber-1)*pageSize;
        
        //creating data-table data
        for(; x<=(pageNumber)*pageSize; x++){
            if(allData[x]){
                data.push(allData[x]);
            }
        }
        component.set("v.data", data);
        
        helper.generatePageList(component, pageNumber);
    },
    
    /*
     * this function generate page list
     * */
    generatePageList : function(component, pageNumber){
        pageNumber = parseInt(pageNumber);
        var pageList = [];
        var totalPages = component.get("v.totalPages");
        if(totalPages > 1){
            if(totalPages <= 10){
                var counter = 2;
                for(; counter < (totalPages); counter++){
                    pageList.push(counter);
                } 
            } else{
                if(pageNumber < 5){
                    pageList.push(2, 3, 4, 5, 6);
                } else{
                    if(pageNumber>(totalPages-5)){
                        pageList.push(totalPages-5, totalPages-4, totalPages-3, totalPages-2, totalPages-1);
                    } else{
                        pageList.push(pageNumber-2, pageNumber-1, pageNumber, pageNumber+1, pageNumber+2);
                    }
                }
            }
        }
        component.set("v.pageList", pageList);
    },
})