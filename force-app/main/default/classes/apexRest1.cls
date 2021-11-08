@restResource (Urlmapping='/rest/*')
global class apexRest1 {
	
    @httpGET
    global static void getAccountInfo(){
        restRequest req = restContext.request;
        restResponse resp = restContext.response;
        wrapperAcc objWrp = new wrapperAcc();
        
        string value = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        account acc = [select id, Name, Phone from account WHERE Id =: value];
        objWrp.customerName = acc.Name;
        objWrp.customerPhone = acc.Phone;
        resp.statusCode = 200;
        resp.responseBody = blob.valueOf(JSON.serializePretty(objWrp));
    }
    
     global class wrapperAcc{
        public string customerName {get;set;}
        public string customerPhone {get;set;} 
    }
}