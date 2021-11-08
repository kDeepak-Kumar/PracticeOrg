public class AccountController {

public AccountController(ApexPages.StandardController controller) {
AccountObject=new Account();
    }
    
public PageReference savingRecord() {
        insert AccountObject;//dml       
        pageReference pref = new PageReference('/'+ AccountObject.id);
        return pref;
    }
    public Account AccountObject{get;set;}
    

    public AccountController() {
    

    }

    

    
    
}