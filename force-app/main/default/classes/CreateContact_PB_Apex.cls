public class CreateContact_PB_Apex {
    @invocableMethod
    public static void CreateConRec(list<id> accId){
        for(id aId:accId){
            contact conObj = new contact();
            conObj.LastName = 'Testing PB';
            conObj.Phone = '123456';
            conObj.AccountId = aId;
            insert conObj;
        }    
        
        
        
    }
}