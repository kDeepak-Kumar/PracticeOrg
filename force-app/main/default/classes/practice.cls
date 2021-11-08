/* Organisation: Swihzz Tech 
* Description of Yamaha Bike R15
========================================
S No.  Name		Date		Changes
========================================
1.		Deepak		23-11-2019	
*/

public class practice {
    
    public static List<account> gettingAccId(){
        
        return [select id from account limit 2];
    }
    
    public static void accWithOppRecords(){
        List<account> accId = gettingAccId();
        for(account accEach:accId){
            list<Opportunity> oppList = [select id, closedate, accountid, stagename from Opportunity 
                                         where accountid =: accEach.id and stagename = 'closed lost'];
            for(Opportunity oppEach:oppList){
                map<id,list<Opportunity>> accOppMap = new map<id,list<Opportunity>>();
                accOppMap.put(oppEach.accountId, new list<opportunity>{oppEach});
                system.debug('Account Id associated With opportunity records are ::'+accOppMap);
            }
        }
    }
}