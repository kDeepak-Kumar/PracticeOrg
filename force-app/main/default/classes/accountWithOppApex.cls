public class accountWithOppApex {

    public static account accRecord(){
        return [select id from account limit 1];
    }
    
    public static void accWithOpp(){
        account accRec= accRecord();
        list<opportunity> oppList = [select name, stagename, accountid from opportunity where accountid =: accRec.id ];
        map<id,list<opportunity>> accOppMap = new map<id,list<opportunity>>();
        if(!oppList.isempty()){
            for(opportunity oppRec:oppList)
                accOppMap.put(oppRec.accountid,new list<opportunity>{oppRec}) ;  
        }
        system.debug('Account with Opportunity Records ::'+accOppMap);
    }
}