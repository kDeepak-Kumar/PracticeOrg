/*
* Descripiton  : Trigger on contact Apex Class
* Last modified by
======================================================
S No. 	Date 		Name		Changes
======================================================
1.		05-12-2019	K.Deepak	Contact Trigger Apex
*/


public with sharing class ContactTriggerHandler {
    
    public static void beforeInsertTrigger(list<contact> newConList){       
        
        
    } // end of beforeInsertTrigger
    public static void beforeUpdateTrigger(list<contact> newConList, map<id,contact> newconMap, list<contact> oldConList, map<id,contact> oldConMap){
        
        
    } // end of beforeUpdateTrigger
    public static void beforeDeleteTrigger(list<contact> oldConList,  map<id,contact> oldConMap){
        
        
    } // end of beforeDeleteTrigger
    public static void afterInsertTrigger(list<contact> newConList,  map<id,contact> newconMap){        
        
        set<id> accId = new set<id>();
        for(contact c:newConMap.values()){
            if(c.AccountId != null){
                accId.add(c.AccountId);
            }
        }
        Integer count = [select count() from contact where accountId IN: accId ];
        list<account> accList = [select sum_of_contacts__c from account where Id IN:accid];
        for(account a:accList){
            a.Sum_of_Contacts__c = count;
        }
        Update accList;
        
        
    } // end of afterInsertTrigger
    public static void afterUpdateTrigger(list<contact> newConList, map<id,contact> NewconMap, list<contact> oldConList, map<id,contact> oldConMap){       
        
        
    } // end of afterUpdateTrigger
    public static void afterDeleteTrigger(list<contact> oldConList, map<id,contact> oldConMap){
        
        set<id> accId = new set<id>();
        for(contact c:oldConMap.values()){
            if(c.AccountId != null){
                accId.add(c.AccountId);
            }
        }
        
        for(account a:[select sum_of_contacts__c from account where ID IN: accId]){
            a.Sum_of_Contacts__c = [select count() from contact where accountId IN: accId];
            Update a;
        }
    } // end of afterDeleteTrigger
    public static void afterUndeletTrigger(list<contact> NewConList,  map<id,contact> NewconMap){
               
        set<id> accId = new set<id>();
        for(contact c:newConMap.values()){
            if(c.AccountId != null){
                accId.add(c.AccountId);
            }
        }
        Integer count = [select count() from contact where accountId IN: accId ];
        list<account> accList = [select sum_of_contacts__c from account where Id IN:accid];
        for(account a:accList){
            a.Sum_of_Contacts__c = count;
        }
        Update accList;
        
    } // end of afterUndeletTrigger
}