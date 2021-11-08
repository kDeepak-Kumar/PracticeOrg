public class Example_Acc_Con_Apex {
    
   @auraEnabled
    public static Contact ContactRecord(String conId){
        return [select Id, AccountId from contact where Id =: conId];
    }
    @auraEnabled
    public static list<account> AccountRecords(){
            return [select id, Name, Phone, Industry, Rating from account  Where Id Not In (select accountId from contact where AccountId !='')];
    }
    @auraEnabled
    public static String  updateContact(String accId,String ConId){
        contact con=[select accountId from contact where id=:ConId];
        con.accountId=accId;
        update con;
        return con.id;
    }
}