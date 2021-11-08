public class accId {
 @invocableMethod
    public static void CreateConRec(list<Account> accId){
        for(Account aId:accId){
            contact conObj = new contact();
            conObj.LastName = 'Testing PB';
            conObj.Phone = '123456';
            conObj.AccountId = aId.id;
            insert conObj;
        }    
        
        
        
    }
}