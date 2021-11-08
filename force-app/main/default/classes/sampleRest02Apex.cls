@restResource(urlmapping='/Deepak/CustomerInformation/*')
global class sampleRest02Apex {
    @httpGet
    global static list<AccVariablesWrapper> gettingAccountRecMethod(){
        
        restRequest request = restContext.request;
        restResponse response = restContext.response;
        list<AccVariablesWrapper> accidlist = new list <AccVariablesWrapper>();
        AccVariablesWrapper objWrp = new AccVariablesWrapper();
        string value = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        list<account> accRecord = [select id, name, phone from account limit 5];
       
        for(account accEach:accRecord){
            objWrp.Customer_Name = accEach.Name;
            objWrp.Customer_PhoneNo = accEach.Phone;
            accidlist.add(objWrp);
        }
        
        return accidlist;        
    }
    
    global class AccVariablesWrapper{
        
        public string Customer_Name {get;set;}
        public string Customer_PhoneNo {get;set;}
    }
    
}