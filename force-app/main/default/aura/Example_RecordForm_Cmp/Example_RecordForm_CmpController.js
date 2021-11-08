({
	show : function(component, event, helper) {
		component.set("v.recId",'0012v00002k86HFAAY');
	},
    conShow : function(component){
        component.set("v.recId",'0032v00003QucCPAAZ');
    },
    handleSubmit : function(cmp, event, helper) {
        event.preventDefault();       // stop the form from submitting
        const fields = event.getParam('fields');
        fields.LastName = 'My Custom Last Name'; // modify a field
        cmp.find('myRecordForm').submit(fields);
    }
})