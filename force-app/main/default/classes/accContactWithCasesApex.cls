/* Organization : Swhizz Tech .. !!
* Descripiton  : Displaying Account associated contact associated with List of cases
Syntax --> map<id,map<id,List<case>>>
* Last modified by
======================================================
S No. 	Date 		Name		Changes
======================================================
1.		27-11-2019	K.Deepak	Initial draft
*/

public class accContactWithCasesApex {
    
    public static account accQuery(){
        return [select id from account limit 1];       
    } // end of accQuery method
    
    public static List<contact> conQuery(){
        account acc = accQuery();
        return [ select id, accountid from contact  where accountid =: acc.id limit 1]; 
        //system.debug(''+);
    }
    
    public static void casesWithContacts(){
        list<contact> con = conQuery();
        list<case>  caseQ = [select id, contactid, accountid, casenumber, status from case where contactid =: con];
        map<id,map<id,list<case>>> accConCaseMap = new map<id,map<id,list<case>>>();
        map<id,list<case>> conCaseMap = new map<id,list<case>>(); 
        if(!caseQ.isEmpty()){
            for(case caseForEach : caseQ){
                if(caseForEach.ContactId != null){
                    conCaseMap.put(caseForEach.ContactId,new list<case>{caseForEach});
                    accConCaseMap.put(caseForEach.AccountId,conCaseMap); 
                    system.debug(''+accConCaseMap);
                    
                }          
            } 
        }
    }               
}