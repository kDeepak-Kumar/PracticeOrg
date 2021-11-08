public class AccountAssociatedContactApex {
    
    @auraEnabled
    public static list<contact> AccountAssociatedContactMethod(){
        
        set<id> accounIdSet = new set<id>();
        for(account accEach:[select id from account]){
            accounIdSet.add(accEach.id);
        }
        
        return [select accountId, account.name, FirstName, LastName, Phone, Email from contact where accountId IN : accounIdSet AND Createddate = today];
    }

}