@restResource(urlmapping='/Deepak/CustomerInfo/*')
global class SampleRestApex {
	@httpDelete
    global static list<contact> getAccountRecord(){
        
       restRequest req = restContext.request;
       RestResponse resp = restContext.response;
        
        string value = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        account accRec = [select id, name, phone from account where Name = 'Edge Communications' ];
        list<contact> conList = [select id, LastName, phone, accountId from contact where accountId =: accRec.id];
        return conList;
        
    }
    
}