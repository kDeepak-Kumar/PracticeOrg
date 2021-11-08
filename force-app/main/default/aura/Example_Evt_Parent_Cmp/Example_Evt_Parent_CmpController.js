({
	handleAccCmpEvent : function(component, event, helper) {
		//Avoiding Recurssion and making contact Record Form flase when viewing account record
        if(component.get("v.conFlag") == true){
            component.set("v.conFlag",false);
        }
        
        var accRecId = event.getParam("accRecordId");
		var flagValue = event.getParam("flagEvt");
        // set the handler attributes based on event data
        component.set("v.accFlag",flagValue);
        console.log('flag value::'+flagValue);
        component.set("v.recordId", accRecId );
        console.log('Id value::'+accRecId);
        
        component.set("v.fields",['Name','AnnualRevenue','Industry','Phone','BillingState','BillingCity','Website'])
	},
    
    handleConCmpEvent :function(component,event,helper){
        //Avoiding Recurssion and making account Record Form flase when viewing contact record
        if(component.get("v.accFlag") == true){
            component.set("v.accFlag",false);
        }
        var conRecId = event.getParam("conRecordId");
		var flagValue = event.getParam("flagEvt");
        // set the handler attributes based on event data
        component.set("v.conFlag",flagValue);
        component.set("v.recordId", conRecId);
        component.set("v.fields",['FirstName','LastName','OwnerId','Phone','OtherState','OtherCity','Email','Description'] )
    }
})