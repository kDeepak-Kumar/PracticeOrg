public with sharing class ContactTriggerUtilityApex {
	
    public static void ContactUtilityMethod(list<contact> newConList, map<id,contact> NewconMap){
        
        set<id> accountIdSet = new set<id>();
        for(contact NewconEach:newconMap.values()){
            if(NewConEach.AccountId != Null){
                accountIdSet.add(NewConEach.AccountId);
            }
        }
        
        Map<id,account> accMap = new map<id,account>([select id, Contact_Annual_Revenue__c,
                                 (select id, Annual_revenue__c from contacts)
                                 FROM Account where Id =: accountIdSet ]);
        list<AggregateResult> aggResult = [select  Max(Annual_revenue__c )AnnRev from Contact 
                                           where accountId =: accountIdSet
                                          ];
        List<account> UpdatedAccRec = new List<account>();
        if(aggResult != null ){
            for(contact conEach:NewConMap.values()){
                for(AggregateResult aggEach:aggResult){
                    if(accMap.containsKey(conEach.AccountId)){
                       account acc = accMap.get(conEach.AccountId);
                        acc.Contact_Annual_Revenue__c = (decimal)aggEach.get('AnnRev');
                        acc.Contact_Annual_Revenue_Name__c = conEach.LastName;
                        UpdatedAccRec.add(acc);
                    }
                }
            }
            Update UpdatedAccRec;
        }
    }
}