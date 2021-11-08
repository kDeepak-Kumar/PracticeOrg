public class practiceClass {
    
    
    public static void accountsCon(){
        list<account> accConList = [select Id, name ,
                                    (select Id, lastName from contacts where accountId != null) from account limit1];
       
        for(account a:accConList){
            for(contact c:a.contacts){
                
            }
        }
    }
}