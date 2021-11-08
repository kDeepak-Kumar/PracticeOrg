({
    initHelper: function (component, event, helper) {
        component.set('v.columns',[
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'string'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Rating', fieldName: 'Rating', type: 'text'},
            {label: 'Action', type: 'button', typeAttributes: { label: 'Show Contacts', name: 'Show_Contacts', title: 'Click to Display Contact Records', iconName: 'action:preview'}},
        ]);
            var action = component.get('c.accRecords');
            action.setCallback(this,function(response){
            var state = response.getState();
            console.log('State Value::'+state);
            if(state==='SUCCESS'){
            console.log('Result');
            component.set("v.totalPages", Math.ceil(response.getReturnValue().length/component.get("v.pageSize")));
            component.set("v.allData", response.getReturnValue());
            component.set("v.currentPageNumber",1);
            helper.buildData(component, helper);
            }
            });
            $A.enqueueAction(action);
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