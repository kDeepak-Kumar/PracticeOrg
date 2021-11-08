public class CarTypesApex {

    @auraEnabled
    public static list<car_Type__c> getCarTypesRecordsmethod(){
        return [select id , Name from Car_Type__c];
    }
}