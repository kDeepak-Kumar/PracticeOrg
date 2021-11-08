public class Example_StockApproval_Apex {
    @invocableMethod
    public static void CreateCaseRecord(list<id> OppRecId){
        list<opportunity> oppList = new list<opportunity>();
        for(id oppId:OppRecId){
            opportunity oppRec = [select id, stock__c from Opportunity where Id =: oppId AND stock__c > 1000];
            oppList.add(oppRec);
        }
        for(opportunity opp:oppList){
            case obj = new case();
            obj.Status = 'New';
            obj.Origin = 'Web';
            obj.Opportunity_Stock__c = opp.stock__c;
        }
    }
}