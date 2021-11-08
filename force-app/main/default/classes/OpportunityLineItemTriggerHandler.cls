public class OpportunityLineItemTriggerHandler {

    public static void afterInsertTrigger(list<OpportunityLineItem> newOppLineList, map<id,OpportunityLineItem> newOppLineMap, list<OpportunityLineItem> oldOppLineList){
        
        
        set<id> opportunityIdSet = new set<id>();    // Getting Opportunity Id's
        list<OpportunityLineItem> oppLineAccList = new list<OpportunityLineItem>();
        for(OpportunityLineItem opp:newOppLineList){
            if(string.isNotBlank(opp.OpportunityId)){
                opportunityIdSet.add(opp.OpportunityId);
                oppLineAccList.add(opp);               
            }
        }        
        list<case> caseUpdateList = new list<case>();   //Updated CaseRecords
        list<opportunity> oppList = [select id, accountid,(select id,name,product2.name from opportunityLineItems) from opportunity where accountid != null AND Id IN : opportunityIdSet ];
        list<case> caseList = [select id, accountId, description from case ];
       // list<opportunityLineItem> lineItems=new list<opportunityLineItem>();
        for(opportunity oppEach: oppList){
            //lineItems.add(oppEach.opportunityLineItems);
            for(case caseEach:caseList){
                if(caseEach.accountId == oppEach.AccountId ){
                    
                        
                        for(OpportunityLineItem oppLineEach:oppLineAccList){
                          //  for(OpportunityLineItem obj:lineItems){
                          
                        caseEach.description += 'Product Name::'+'\n'+  'Quanity ::'+oppLineEach.Quantity + 'Description ::'+oppLineEach.Description;
                        caseUpdateList.add(caseEach);
                    
                    }
                      
                }
                database.update(caseUpdateList);
            }            
        }
    } 
   // } 
}  // end of afterInsertTrigger