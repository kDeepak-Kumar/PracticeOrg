public class exampleApex {
	@auraEnabled
    public static void getContacts(){
        list<account> accList = [select id,(select id from contacts) from account where id= '0012v00002W4GS6AAN' ];
    }
}