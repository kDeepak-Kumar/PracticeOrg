public class PickListController {
    
    //To fetch records dynamically
    @AuraEnabled
    public static List<sObject> retrieveDetails(String sObjectName){
        
        List<sObject> sObjectList = new List<sObject>();
        String query ='SELECT Id,Name FROM '+ sObjectName +' LIMIT 10';
        system.debug('query'+query);
        sObjectList = Database.query(query);
        return sObjectList;
    }
}