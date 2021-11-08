@isTest
public class OpportunityTriggerTest {
    
    public static Testmethod void doCheckOppTrigger(){
        
        Test.startTest();
        opportunity obj = new opportunity();
        obj.Name = 'Test Class Check';
        obj.Amount = 60000;
        obj.StageName = 'Closed Lost';
        obj.CloseDate = date.newInstance(2019, 12, 19);
        insert obj;
        Test.stopTest();
        opportunity oppRecord = [select id, Approval_Status__c, amount from opportunity ];
        system.assertEquals('Submitted', oppRecord.Approval_Status__c, 'Matching');
        
        
    }
}