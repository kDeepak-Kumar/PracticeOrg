public class AnnualRevenue_Apex {
    public static void afterInsert(list<contact> newList){
        map<id,decimal> accMap = new map<id,decimal>();
        for(contact con:newList){
            decimal amount=0;
            if(accMap.containsKey(con.accountId)){
                amount = accMap.get(con.accountId)+con.Annual_revenue__c;
            }else{
                amount = con.Annual_revenue__c; 
                system.debug('Amount in Else::'+amount);
            }
            accMap.put(con.AccountId, amount);
            system.debug('Map Value::'+accMap);
        }
        set<id> accIds = accMap.keyset();
        list<account> accList = [select Id, Contact_Annual_Revenue__c from account WHERE Id IN: accIds];
        for(account acc:accList){
            decimal amount = accMap.get(acc.Id);
            acc.Contact_Annual_Revenue__c = acc.Contact_Annual_Revenue__c + accMap.get(acc.Id);
            system.debug('Final Amount ::'+acc.Contact_Annual_Revenue__c);
        }
        Update accList;
    }
    
    public static void afterUpdate(map<id,contact> newMap,map<id,contact> oldMap){
        map<id,Decimal> accMap = new map<id,Decimal>();
        set<id> conIds = oldMap.keyset();
        for(Id id:conIds){
            contact oldCon = oldMap.get(id);
            contact newCon = newMap.get(id);
            if(oldCon.Annual_revenue__c != newCon.Annual_revenue__c){
                decimal amount = newCon.Annual_revenue__c - oldCon.Annual_revenue__c;
                if(accMap.containsKey(newCon.AccountId)){
                    amount = accMap.get(newCon.AccountId)+NewCon.Annual_revenue__c;
                }
                accMap.put(newCon.AccountId,amount);
            }
            set<id> accIds = accMap.keySet();
            list<account> accList = [select id,Contact_Annual_Revenue__c from account WHERE ID IN: accIds ];
            for(account acc:accList){
                decimal amount = accMap.get(acc.Id);
                acc.Contact_Annual_Revenue__c = acc.Contact_Annual_Revenue__c + amount;
            }
            Update accList;
        }
    }
    
    public static void afterDelete(list<contact> conList){
        map<id,account> accMap = new map<id,account>();
        for(contact con:conList){
            if(accMap.containsKey(con.AccountId)){
                account a = accMap.get(con.AccountId);
                a.Contact_Annual_Revenue__c = a.Contact_Annual_Revenue__c - con.Annual_revenue__c;
            }else {
                account a = accMap.get(con.AccountId);
                a.Contact_Annual_Revenue__c = a.Contact_Annual_Revenue__c ;
            }
            
        }

    }
}