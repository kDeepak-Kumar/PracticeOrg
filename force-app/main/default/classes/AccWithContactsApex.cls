public class AccWithContactsApex {
    
    public static void AccountAssociatedWithContacts(){
        set<id> accountIdSet = new set<id>();
        List<account> accId = [select id from account limit 1];
        if(!accId.isempty()){
            For(account accEach:accId){
                accountIdSet.add(accEach.id);                
            }
        }
        Map<id,List<contact>> accWithContactList = new Map<id,List<contact>>();
        List<contact> conList = new List<contact>([select id,lastName,Phone,AccountId from contact where accountId IN :accountIdSet]);
        if(!ConList.isempty()){
            for(contact conEach:conList){
                accWithContactList.put(conEach.accountId,  new list<contact>{conEach});
            system.debug('Contact Associated Values::'+accWithContactList);

            }
        }
       
    }
}