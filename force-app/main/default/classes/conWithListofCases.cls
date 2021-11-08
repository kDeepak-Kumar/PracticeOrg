/* Organization : Swhizz Tech .. !!
* Descripiton  : Displaying contact associated with List of cases
				 Syntax --> map<contactid,List<case>>
* Last modified by
======================================================
S No. 	Date 		Name		Changes
======================================================
1.		28-11-2019	K.Deepak	Initial draft
*/

public class conWithListofCases{
    
    public static contact gettingConId(){
        return [select id from contact limit 1];
    }
    
    public static void conWithCases(){
        contact conid = gettingConId();
        list<case> caseRec = [select id, contactid, casenumber, status from case where contactid =: conid.id];
        map<id,list<case>> conCaseMap = new map<id,list<case>>();
        for(case caseEach:caseRec){
            conCaseMap.put(caseEach.contactid,new list<case>{caseEach});
            system.debug('contact Associated with list of case Records are ::'+conCaseMap);
            
        }
        
    }
}