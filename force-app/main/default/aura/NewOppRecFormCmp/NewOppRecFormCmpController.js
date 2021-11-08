({
    handleLoad: function(cmp, event, helper) {
        //cmp.set('v.showSpinner', false);
    },
    
    handleSubmit: function(cmp, event, helper) {
        //cmp.set('v.disabled', true);
        //cmp.set('v.showSpinner', true);
    },
    
    handleError: function(cmp, event, helper) {
        // errors are handled by lightning:inputField and lightning:messages
        // so this just hides the spinner
        //cmp.set('v.showSpinner', false);
    },
    
    handleSuccess: function(cmp, event, helper) {
        var params = event.getParams();
        console.log('Record id ::'+params.response.id)
        //cmp.set('v.recordId', params.response.id);
        //cmp.set('v.showSpinner', false);
        //cmp.set('v.saved', true);
        var cmpEvent = cmp.getEvent("NewOppRecFormRegEvent");
        cmpEvent.setParams({
            "toShowVar" : false});
        cmpEvent.fire();        
    }
    
})