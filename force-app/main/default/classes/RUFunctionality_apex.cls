public class RUFunctionality_apex {
	
    public static void afterInsert(list<account> accList){
        integer count = 0;
        list<contact> newCon = new List<contact> ();
        for(account acc:accList){
            for(integer i=0;i<2;i++){
                contact con = new contact();
                con.lastName = 'create';
                newCon.add(con);
            }
        }
        Insert newCon;
    }
}