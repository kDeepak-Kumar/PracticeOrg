/* Organization : Swhizz Tech .. !!
* Descripiton  : Displaying Opp id with the Opportunity records where stagename = closed won
				 Syntax --> map<Opportunityid,List<opportunity>>
				 
* Last modified by
======================================================
S No. 	Date 		Name		Changes
======================================================
1.		28-11-2019	K.Deepak	Initial draft
*/

public class OppidWithOppRec{   
    
    public static void oppCl(){
        List<opportunity> opp=[select id,name, stageName from Opportunity where stagename = 'closed won'];
        Map<Id,list<Opportunity>> oppMap = new Map<Id,list<Opportunity>>();
        for(opportunity p:opp){
            oppMap.put(p.id,new list<opportunity>{p}); 
            system.debug(''+oppMap);            
        }
    }
}