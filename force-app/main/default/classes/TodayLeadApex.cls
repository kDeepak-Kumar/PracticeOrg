public class TodayLeadApex {
    
    @auraEnabled
    public static list<lead> todayLeadMethod(){        
        return [select id, LastName, FirstName, Phone, Company from lead where createdDate = today];
    }

}