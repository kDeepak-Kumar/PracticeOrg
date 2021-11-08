public class Example_Evt_Apex {
	@auraEnabled
    public static string createAccRec(account acc){
        string result;
        try{
            insert acc;
            result = acc.id;
        }
        catch(exception e){
            result =' insertion failed'+e.getTypeName();                
        }
        return result;
    }
    @auraEnabled
    public static string createConRec(contact con){
        string result;
        try{
            insert con;
            result = con.id;
        }
        catch(exception e){
            result='Insertion Failed'+e.getTypeName();
        }
        return result;
    }
}