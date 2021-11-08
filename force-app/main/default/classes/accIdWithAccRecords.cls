/* Organization : Swhizz Tech .. !!
 * Descripiton  : Map<id,account> getting ten account record details with associated account id 
 * Last modified by
   ======================================================
	S No. 	Date 		Name		Changes
   ======================================================
	1.		27-11-2019	K.Deepak	Initial draft
*/


public class accIdWithAccRecords{
    
    public static List<contact> gettingAccId(){
        return [select accountid from contact where accountid != null limit 10];
    }
    
    public static void gettingAccRecords(){
        List<contact> accId = gettingAccId();
        for(contact aI:accId){
            List<account> accList = [select id, name, phone from account where id =: aI.accountid ];
            for(account a:accList){
                map<id,List<account>> accMap = new map<id,List<account>>();
                accMap.put(a.id, new list<account>{a}); 
                system.debug('account id with associated account records are ::'+accMap);                
            }
        }        
    }
}