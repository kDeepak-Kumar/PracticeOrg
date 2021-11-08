public class Example_TabSetApex {
    
    @auraEnabled
    public static list<account> accRecords(){
        return [select id, Name, Phone, Rating, IsActive__c, Industry from account];
    }
    
    @auraEnabled
    public static string createContact(string lName, string fName, String phone, string email){
        string result;
        try{
            contact conObj = new contact();
            conObj.lastName = lName;
            conObj.FirstName = fName;
            conObj.Phone = phone;
            conObj.Email = email;
            insert conObj; 
            result = 'Insertion Succesful';
        }catch(Exception e){
            result='insertion Failed'+e.getTypeName();
        }
        return result;        
    }
    
}