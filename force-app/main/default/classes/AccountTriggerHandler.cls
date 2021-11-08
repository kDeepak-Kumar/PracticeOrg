public with sharing class AccountTriggerHandler {
    
    public static void beforeInsertTrigger(list<account> newAccList){
        
        
    } // end of beforeInsertTrigger
    public static void beforeUpdateTrigger(list<account> newAccList, map<id,account> newAccMap, list<account> oldAccList, map<id,account> oldAccMap){
         
        
    } // end of beforeUpdateTrigger
    public static void beforeDeleteTrigger(list<account> oldAccList, map<id,account> oldAccMap){
                
        
    } // end of beforeDeleteTrigger
    public static void afterInsertTrigger(list<account> newAccList,  map<id,account> newAccMap){
        
        
    } // end of afterInsertTrigger
    public static void afterUpdateTrigger(list<account> newAccList, map<id,account> NewAccMap, list<account> oldAccList, map<id,account> oldAccMap){
           
        set<id> oldIdSet = new set<id>();
        for(account aNew:newAccList){
            account aOld = OldAccMap.get(aNew.id);
            if(aNew.Opportunity__c != aOld.Opportunity__C){
                oldIdSet.add(aOld.Id);
            }
        }
        
        
        
        
    } // end of afterUpdateTrigger
    public static void afterDeleteTrigger(list<account> oldAccList, map<id,account> oldAccMap){
        
        
    } // end of afterDeleteTrigger
    public static void afterUndeletTrigger(list<account> NewAccList, map<id,account> NewAccMap){
        
        
    } // end of afterUndeletTrigger
}