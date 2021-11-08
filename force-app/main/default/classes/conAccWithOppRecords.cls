/* Organization : Swhizz Tech .. !!
* Descripiton  : Displaying Contact ID with account ID associated with List of opportunites
				 Syntax --> map<ContactId,map<accountid,List<opportunities>>>
* Last modified by
======================================================
S No. 	Date 		Name		Changes
======================================================
1.		28-11-2019	K.Deepak	Initial draft
*/

public class conAccWithOppRecords{
    
    public static account gettingAccId(){
        return [select id from account limit 1];
    }
    public static contact gettingAccConId(){
        Account accid= gettingAccId();
        return [select id, accountid from contact where accountid =:accid.id limit 1];
    }
    
    public static void accContOppRecords(){
        Account accId = gettingAccId();
        contact conId = gettingAccConId();
        list<opportunity> oppRecList = [select id, accountid, stagename, closedate from opportunity where accountid =: accId.id];
        map<id,map<id,list<Opportunity>>> conAccOppMap = new map<id,map<id,list<Opportunity>>>();
        map<id,list<Opportunity>> accOppMap = new map<id,list<Opportunity>>();
        for(opportunity oppEach:oppRecList){
            accOppMap.put(oppEach.accountid,new list<opportunity>{oppEach});
            conAccOppMap.put(conID.id,accOppMap);
            system.debug('accountId with contactId associated with list of opportunity records are ::'+conAccOppMap);          
        }        
    }
}