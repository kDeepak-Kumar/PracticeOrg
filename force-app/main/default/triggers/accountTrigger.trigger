trigger accountTrigger on Account (before insert, after insert,before update, after update, before delete, after delete, after undelete) {
    
    
    if(trigger.isbefore){
        if(trigger.isinsert){
            AccountTriggerHandler.beforeInsertTrigger(trigger.new);
        }else if(trigger.isupdate){
            AccountTriggerHandler.beforeUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }else if(trigger.isdelete){
            AccountTriggerHandler.beforeDeleteTrigger(trigger.old,trigger.oldMap);
        }
    }else 
        if(trigger.isafter){
            if(trigger.isinsert){
                AccountTriggerHandler.afterInsertTrigger(trigger.new,trigger.newMap);
            }else if(trigger.isupdate){
                AccountTriggerHandler.afterUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
            }else if(trigger.isdelete){
                AccountTriggerHandler.afterDeleteTrigger(trigger.old,trigger.oldMap);
            }else if(trigger.isundelete){
                AccountTriggerHandler.afterUndeletTrigger(trigger.new,trigger.newMap);
            } 
        }

    /*
    if(trigger.isBefore && trigger.isDelete){
        for(account a:[select id from account where ID IN (select accountId from Opportunity) 
                       and ID IN: trigger.old]){
            trigger.oldMap.get(a.ID).addError('you cannot delete accounts associated with Opportunity');
        }
    } */
    
    /*
    if(trigger.isbefore && trigger.isinsert){
        for(account a:trigger.new){
            account acc = new account();
            acc.Name =a.Name;
            acc.Phone = a.Phone;
            acc.BillingCountry = a.BillingCountry;
            insert acc;
            RestAPIGetBharath.createAccount(acc.Id);
        }
    }
	*/
    
}