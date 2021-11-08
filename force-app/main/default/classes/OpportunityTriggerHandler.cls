public with sharing class OpportunityTriggerHandler {
    
    public static void beforeInsertTrigger(list<opportunity> newOppList){
        
    } // end of beforeInsertTrigger
    public static void beforeUpdateTrigger(list<opportunity> newOppList, map<id,opportunity> newOppMap, list<opportunity> oldOppList, map<id,opportunity> oldOppMap){
        
        
    }//end method    
    public static void beforeDeleteTrigger(list<opportunity> oldOppList, map<id,opportunity> oldOppMap){
        
        
    } // end of beforeDeleteTrigger
    public static void afterInsertTrigger(list<opportunity> newOppList, map<id,opportunity> newOppMap){
        
       /* list<opportunity> UpdatedOppRec = new list<opportunity>();
        list<Opportunity> OppList = [select id, Amount, Approval_Status__c from Opportunity ];
        for(Opportunity OppEach:OppList){
            if(oppEach.Amount > 50000){
                oppEach.Approval_Status__c = 'Submitted';
                UpdatedOppRec.add(oppEach);
                
            }
            Update UpdatedOppRec;
        }*/
                
    } // end of afterInsertTrigger
    public static void afterUpdateTrigger(list<opportunity> newOppList, map<id,opportunity> NewOppMap, list<opportunity> oldOppList, map<id,opportunity> oldOppMap){
        
        
        
    } // end of afterUpdateTrigger
    public static void afterDeleteTrigger(list<opportunity> oldOppList, map<id,opportunity> oldOppMap){
        
        
    } // end of afterDeleteTrigger
    public static void afterUndeletTrigger(list<opportunity> newOppList,  map<id,opportunity> newOppMap){
        
        
    } // end of afterUndeletTrigger
}