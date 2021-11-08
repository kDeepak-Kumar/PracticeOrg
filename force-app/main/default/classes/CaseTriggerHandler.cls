public class CaseTriggerHandler {

    public static void beforeInsertTrigger(list<case> newcaseList){
        
        // Stoping the user from creating more than 3 Cases in a month
        
        /*for(case caseEach:newcaseList){
            if(caseEach.ownerId == userinfo.getUserId()){
                if([select count() from case where createdDate = THIS_MONTH ] > 2){   //It doesn't allow to create more than three cases in a month
                 caseEach.addError('You Cannot Create More than Three Case');         // It starts from Zero
                }
            }
        }*/
        
        
    } // end of beforeInsertTrigger
    public static void beforeUpdateTrigger(list<case> newcaseList, map<id,case> newcaseMap, list<case> oldcaseList, map<id,case> oldcaseMap){
        
        
        
    } // end of beforeUpdateTrigger
    public static void beforeDeleteTrigger(list<case> oldcaseList, map<id,case> oldcaseMap){
        
        
        
    } // end of beforeDeleteTrigger
    public static void afterInsertTrigger(list<case> newcaseList,  map<id,case> newcaseMap){
        
        
        
    } // end of afterInsertTrigger
    public static void afterUpdateTrigger(list<case> newcaseList, map<id,case> NewcaseMap, list<case> oldcaseList, map<id,case> oldcaseMap){
        
        
        
    } // end of afterUpdateTrigger
    public static void afterDeleteTrigger(list<case> oldcaseList, map<id,case> oldcaseMap){
        
        
        
    } // end of afterDeleteTrigger
    public static void afterUndeletTrigger(list<case> NewcaseList, map<id,case> NewcaseMap){
        
        
    } // end of afterUndeletTrigger
}