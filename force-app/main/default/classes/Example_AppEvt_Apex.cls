public class Example_AppEvt_Apex {
    @auraEnabled
    public static Account createAccRec(account acc){
        insert acc;
        return acc;
    }
    @auraEnabled
    public static Account Search(string accName){
        return [select Id, Name, Phone, Industry from account where Name =: accName];
    }
    @auraEnabled
    public static Contact CreateConRec(Contact con){
        insert con;
        return con;
    }
    @auraEnabled
    public static list<contact> searchConRec(Id accId){
        return [select Id, LastName, FirstName, Phone, Email from contact where accountId =: accId];
    }
    @auraEnabled 
    public static list<opportunity> searchOppRec(Id accId){
        return [select Id, Name, Amount from Opportunity where accountId =: accId];
    }
}