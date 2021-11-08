@restResource(urlmapping='/Deepak/CustomerInfor/*')
global class SampleRest01Apex {
    @httpGet
    global static RespWrapper gettingAccountRecMethod(){
        
        restRequest request = restcontext.request;
        restResponse response = restcontext.response;
        
        RespWrapper objWrp = new RespWrapper();
        string value = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        account accRecord = [select id, name, phone from account where id =: value];
        objWrp.customer_Name = accRecord.Name;
        objWrp.customer_Phone = accRecord.Phone;
        return objWrp;
    }
    
    global class RespWrapper{
        
            public string customer_Name {get;set;}
        	public string customer_phone {get;set;}
        
    }
}