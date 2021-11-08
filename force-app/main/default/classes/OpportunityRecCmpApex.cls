public class OpportunityRecCmpApex {
    
    @auraEnabled
    public static list<opportunity> TodayOppRecMethod(){
        
        return [select Name, StageName, AccountId, CloseDate, Probability from Opportunity where Createddate = Today];
    }

}