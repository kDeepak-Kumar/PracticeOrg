/* Organization : Swhizz Tech .. !!
 * Descripiton  : Map<id,account> getting one account record details with associated account id 
 * Last modified by
   ======================================================
	S No. 	Date 		Name		Changes
   ======================================================
	1.		27-11-2019	K.Deepak	Initial draft
*/

public class accIdWithAccRecord {

    public static contact gettingAccId(){
        return [select id, accountid from contact where accountid != null limit 1];
    }
    
    public static void accIdWithAccRec(){
        contact accId = gettingAccId();
        account accRec = [select id, name, phone from account where id =: accId.accountid limit 1];
        map<id,account> accMap = new map<id,account>();
        accMap.put(accRec.id,accRec);
        system.debug('Account ID with that Associated Account record ::'+accMap);        
    }        
}