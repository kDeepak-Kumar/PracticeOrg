public class contactAssociatedWithAccount {
    
    public static contact gettingAccId(){
        return [select id, accountid from contact where accountid != null limit 1];
    } 
    
    public static void accIdwithRecord(){
        contact accId = gettingAccId();
        account accRecord = [select id, name, phone from account where id =: accId.Accountid];
        map<id,account> accMap = new map<id,account>();
        accMap.put(accRecord.id,accRecord);   
        system.debug('account id with account records::'+accMap);
    }
}