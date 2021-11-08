public class ExampleMap {
    
    public static void getAccConMap(){
        list<account> accList = [select Id from account LIMIT 5];
        list<contact> conList = [select Id,name from contact where accountId != null limit 5];
        set<Id> accId = new set<Id>();
        for(contact c:conList){
            accId.add(c.Id);
        }
        map<Id,List<contact>> accConMap = new map<Id,list<contact>>();
        for(Id acc:accId){
            list<contact> cList = [select Id, name from contact where accountId =: acc];
            accConMap.put(acc,cList);
        }
        system.debug('map@@'+accConMap);
    }
    
    
    
    public static void accountRec(){
        map<Id,String> accIdNameMap = new map<Id,string>();
        list<account> accList = [select Id, Name from account order by createdDate LIMIT 3 ];
        for(account acc:accList){
            accIdNameMap.put(acc.Id, acc.Name);
        }
        system.debug('accIdNameMap@@'+accIdNameMap);
        
        string name = accIdNameMap.get(accList[0].Id)+'  testing';	
        accIdNameMap.put(accList[0].Id,name);
        system.debug('updated Map@@'+accIdNameMap);
        //update accIdNameMap.values();
    }
    
    public static void AccountContactsMap(){
        map<Id,List<contact>> accIdContactsMap = new map<Id,List<Contact>>();
        list<Contact> conList = [select Id, Name, accountId from Contact where accountId != null and createdDate = today];
        for(contact con:conList){
            if (accIdContactsMap.containsKey(con.accountId)) {
                accIdContactsMap.get(con.accountId).add(con);
            }
            else {
                accIdContactsMap.put(con.accountId, new List<contact>{ con });
            }
        }
        //system.debug('accIdContactsMap@@'+accIdContactsMap);
        for(Id Key:accIdContactsMap.keySet()){
            system.debug('c@@'+Key);
            list<contact> cList = accIdContactsMap.get(key);
            system.debug('cList@@'+cList);
        }
        
    }
}