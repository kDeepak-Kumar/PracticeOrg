@restResource (urlMapping='/createAccount/*')
global class RestAPIGetBharath {
	
    @httpGET
    global static void createAccount(){
        RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        accountWrapper accObj = new accountWrapper();
        String accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accId];
        accObj.accName = result.Name;
        accObj.accPhone = result.Phone;
        accObj.accBillingCountry = result.BillingCountry;
		resp.statusCode = 200;
		resp.responseBody = blob.valueOf(JSON.serializePretty(accObj));        
    }
    global class accountWrapper{
        
        public string accName {get;set;}
        public string accPhone {get;set;}
        public string accBillingCountry {get;Set;}
    }
}