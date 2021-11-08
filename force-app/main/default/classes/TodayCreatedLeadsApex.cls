public class TodayCreatedLeadsApex {

    @auraEnabled
    public static list<Lead> TodayCreatedLeadsmethod(){
        
        return [select LastName, FirstName, Company, Status from Lead WHERE CreatedDate = Today];
    }
}