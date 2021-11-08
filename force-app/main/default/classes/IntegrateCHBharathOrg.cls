public class IntegrateCHBharathOrg {
    
    public class accountDetails{
        public string Name;
        public string Phone;
        public system.Address BillingAddress;
    }
    
    public static void getAccountRecords(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:connect_CHBharath/services/apexrest/Account');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        system.debug('status code:'+response.getStatus());
        if(response.getStatusCode() == 200) {
            system.debug('response body@@'+response.getBody());
            // If the response has more than one array, then create list and iterate it and collect in map
            list<object> resResult = (list<object>)JSON.deserializeUntyped(response.getBody());
            for(object result:resResult){
                
                map<string,object> respResult = (map<string,object>)result;
                //If it has nested array, then again assign it to map 
                map<string,object> billingDetails = (map<string,object>)respResult.get('BillingAddress');
                system.debug('Name@@'+respResult.get('Name') + '  City@@'+billingDetails.get('city')+ '  state@@'+billingDetails.get('state'));
            }
            
             //If response has one array then typecast it with map
             
            /*map<string,object> results = (map<string,object>)JSON.deserializeUntyped(response.getBody());
            system.debug('Name@@'+results.get('Name')+ '  Phone@@'+results.get('Phone'));
            map<string,object> billingDetails = (map<string,object>) results.get('BillingAddress');
            system.debug('City@@'+billingDetails.get('city'));
            system.debug('country@@'+billingDetails.get('country'));
            system.debug('geocodeAccuracy@@'+billingDetails.get('geocodeAccuracy'));*/
        }
    }
}