@isTest
public class accWithConTestClass {

    testMethod static void createCon(){
        Account a = new account();
        a.name = 'is Test';
        a.phone = '5458114545';
        insert a;
        for(integer i=0;i<5;i++){
            contact con = new contact();
            con.lastname = 'con is Test'+i;
            con.phone = '888888888';
            con.accountid = a.id;
            insert con;
        }
    }
    
}