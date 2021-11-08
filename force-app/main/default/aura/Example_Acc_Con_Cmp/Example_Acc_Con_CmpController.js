({
    init: function (component, event, helper) {
        helper.initHelper(component, event, helper);
    },
        
    getAccountId : function (component,event,helper){
        var account = event.getParam('row');
        component.set('v.selectedRowAcc',account.Id);
        console.log('Checing Seleced Row::'+component.get('v.selectedRowAcc'));
        var conAccountId = component.get('v.contact.AccountId');
        console.log('checking Account Record Existed or Not');
        if(conAccountId == null || conAccountId == undefined){
            var buttonClicked = event.getParam('action');
            if(buttonClicked.name === 'associate_Contact'){
                helper.Update(component,event,helper);
            }
        }else
            if(conAccountId != null){
                console.log('Else if Block Executed');
                component.set('v.showEdit',true);
            }
    },
    
    Save : function(component,event,helper){
		helper.Update(component,event,helper);
        component.set('v.showEdit',false);
        
    },
    
    closeModel: function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.showEdit", false);
    },
    
    cancel : function(component, event, helper) {
        // Set isModalOpen attribute to false  
        component.set("v.showEdit", false);
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
    }
})