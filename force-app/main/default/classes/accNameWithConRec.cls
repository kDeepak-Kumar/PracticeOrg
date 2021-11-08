/* Organization : Swhizz Tech .. !!
* Descripiton  : Displaying account Name with with contact Records
Syntax --> map<accountid,List<contact>>

* Last modified by
======================================================
S No. 	Date 		Name		Changes
======================================================
1.		28-11-2019	K.Deepak	Initial draft
*/


public class accNameWithConRec{
    
    public static account gettingAccIdName(){
        return [select id, name from account where id = '0012v00002W4GS6' limit 1];
    }
    
    public static void accNameWithConRecords(){
        account accIdName = gettingAccIdName();
        List<contact> conRecList = [select id, lastname, accountid, phone from contact where accountid =: accIdName.id];
        map<string,list<contact>> accNameConRec = new map<string,list<contact>>();
        for(contact conEach:conRecList){
            accNameConRec.put(accIdName.name,new list<contact>{conEach});
            system.debug('Account Name with associated contact Records are ::'+accNameConRec);            
        }        
    }
}