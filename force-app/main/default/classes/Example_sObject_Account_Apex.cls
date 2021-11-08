public class Example_sObject_Account_Apex {
	@auraEnabled
    public static string createAccRecord(Account acc){
        string result;
        try{
            insert acc;
            result ='Insertion Succesful'+acc.Id;
        }catch(exception e){
            result='Insertion Failed'+e.getTypeName();
        }
        return result;
    }
}