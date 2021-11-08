public class Subash_Scenario {
    
    public static void CreateAccConOppRecords(){
        Account acc= new account();
        acc.Name = 'Parent Account';
        insert acc;
        
        list<contact> conLst = new list<contact>();
        for(integer i=0;i<10;i++){
            contact con = new contact();
            con.lastName = 'Child Contact '+i;
            con.accountId = acc.Id;
            conLst.add(con);
        }
        if(conLst.size() != 0){
            insert conLst;
        }
    }
    public static void createOppRecords(){
        Opportunity opp = new Opportunity();
        //opp.Name = 'Test';
        
    }
    public static void query(){
        list<account> accLst = [select id , (select id from contacts), (select id from opportunities) from account limit 10];
        for(account acc:accLst){
            list<contact> conLst = acc.contacts;
            if(conLst.size() != 0){
                system.debug('contacts size@@'+conLst.size());
            }
        }
    }
}