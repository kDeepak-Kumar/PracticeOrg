public class RetrieveContactInfoApex {

    @auraEnabled
    public static list<contact> getContactRecordsMethod(){
        
        set<id> accIdSet = new set<id>();
        for(contact conEach:[select id, accountId from contact where accountId != null]){
            accIdSet.add(conEach.accountId);
        }
        return [select id, AccountId, lastname , phone from contact where accountId IN : accIdSet];
    }
}