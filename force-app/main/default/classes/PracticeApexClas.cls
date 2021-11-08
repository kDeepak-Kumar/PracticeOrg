public class PracticeApexClas {
    
    
    public static list<contact> gettingAccountId(){
        list<contact> conList = [select accountid from contact where accountid != null limit 1];
        return conList;
    }
    
    public static void accIdAccRecord(){
        
        list<contact> con = gettingAccountId();
        for(contact conEach:con){
            map<id, account> accMap = new map<id, account>();
            account accRecord = [select id, name , phone from account where id =: conEach.accountId];
                accMap.put(accRecord.Id,accRecord);
                system.debug('Account Id With Account Record'+accMap);
            
        }
    }    
}