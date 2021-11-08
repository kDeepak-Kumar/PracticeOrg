public with sharing class CampaignTriggerApex {
    public static void beforeInsertTrigger(list<campaign> newCamList){
        
        
        
    } // end of beforeInsertTrigger
    public static void beforeUpdateTrigger(list<campaign> newCamList, 
                                           map<id,campaign> newCamMap,
                                           list<campaign> oldCamList,
                                           map<id,campaign> oldCamMap){
                                               
                                               
                                               
                                           }//end method
    
    
    public static void beforeDeleteTrigger(list<campaign> oldCamList,
                                           map<id,campaign> oldCamMap){
                                               
                                           } // end of beforeDeleteTrigger
    public static void afterInsertTrigger(list<campaign> newCamList, 
                                          map<id,campaign> newcamMap){
                                              
                                              
                                              
                                          } // end of afterInsertTrigger
    public static void afterUpdateTrigger(list<campaign> newCamList, 
                                          map<id,campaign> NewcamMap,
                                          list<campaign> oldCamList,
                                          map<id,campaign> oldCamMap){
                                              
                                              
                                              
                                          } // end of afterUpdateTrigger
    public static void afterDeleteTrigger(list<campaign> oldCamList,
                                          map<id,campaign> oldCamMap){
                                              
                                          } // end of afterDeleteTrigger
    public static void afterUndeletTrigger(list<campaign> newCamList, 
                                           map<id,campaign> newCamMap){
                                               
                                           } // end of afterUndeletTrigger
}