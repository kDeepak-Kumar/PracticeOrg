@RestResource(UrlMapping='/returnAccount/*')
global with Sharing class  Rest_ReturnAccounts {

    @httpGet
    global static list<account> returnAccounts(){
        
        restRequest request = RestContext.request;
        restResponse response = RestContext.response;
        Map<string,string> data = request.params;
        string aName = data.get('accName');
        list<account> accList = [select Id,name from Account Where Name =:aName];
        return accList;
    }
}