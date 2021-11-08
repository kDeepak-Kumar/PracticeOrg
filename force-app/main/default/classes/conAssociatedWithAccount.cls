/* Organization : Swhizz Tech .. !!
 * Descripiton  : This class is about method Decleration
 * Last modified by
   ======================================================
	S No. 	Date 		Name		Changes
   ======================================================
	1.		25-11-2019	K.Deepak	Initial draft
*/

public class conAssociatedWithAccount {
    
    public void creatingAccountRec(string accName, string accPhone){
        Account acc = new Account();
        acc.name = accName;
        acc.phone = accPhone;
        insert acc;
        creatingContactRec('Anil','Kumar','9000219093',acc.id);
        
    }    
    public void creatingContactRec(string fname, string lname,  string phone,id accountid ){
        List<contact> conList = new List<contact>();
        for(integer i=0;i<5;i++){
            contact con = new contact();
            con.lastname = lname;
            con.firstname = fname;
            con.phone = phone;
            con.accountid = accountid;
            conList.add(con);
        }
        if(!conList.isempty()){
            insert conList;
            for(contact C:conList){
                system.debug('contact records assciated with account ::'+C);
            }
        }        
    }
}