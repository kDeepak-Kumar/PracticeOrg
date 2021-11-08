/* Organization : Swhizz Tech .. !!
 * Descripiton  : creating 5 contact Records and assiging to account and Creating a map<id,list<contact>>
 														key = accountID, Value = List of associated contacts retrieved from account 
 * Last modified by
   ======================================================
	S No. 	Date 		Name		Changes
   ======================================================
	1.		27-11-2019	K.Deepak	Initial draft
*/

public class accountAssociatedWithContact {
    
    public static account accountRecord(){
        account accQuery = [select id from account limit 1];
        return accQuery;
    } // end of accountRecord method
    
    public static void creatingCon(){
        list<contact> conList = new list<contact>();
        Account AccIdValue = accountRecord();
        for(integer i=0;i<5;i++){  
            contact con = new contact();
            con.lastname = 'Apex Class testing'+i;
            con.phone = '9009001198_'+i;
            con.accountid = AccIdValue.id;
            conList.add(con);                     
        }
        if(!conList.isempty()){
            insert conList;            
            list<contact> conListNew = [select id , lastname, accountid, phone from contact where id =: conList];
            map<id,list<contact>> accConMap = new map<id,list<contact>>();    
            if(!conListNew.isempty()){
                for(contact conEach:conListNew){
                    accConMap.put(conEach.accountid, new list<contact>{conEach});
                    system.debug('account with associated Contact Records::'+accConMap);            
                    
                }
                
            }
            
        }
    }
}