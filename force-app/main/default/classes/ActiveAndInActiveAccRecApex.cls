public class ActiveAndInActiveAccRecApex {

    @auraEnabled
    public static list<account> ActiveAccountRecords(){
        return [select id, Name, Phone, Active__c from account WHERE Active__c = 'Yes'];
    }
    @auraEnabled
    public static list<account> InActiveAccountRecords(){
        return [select id, Name, Phone, Active__c from account WHERE Active__c = 'No'];
    }
}