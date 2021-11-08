public class Example_LayoutItem_Apex {
	@auraEnabled
    public static list<account> accRecords(){
        return [select id, Name, Phone, Industry, Rating, Website from account ];
    }
}