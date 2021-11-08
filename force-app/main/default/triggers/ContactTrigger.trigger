trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
    if(trigger.isbefore){
        if(trigger.isinsert){
            ContactTriggerHandler.beforeInsertTrigger(trigger.new);
        }else if(trigger.isupdate){
            ContactTriggerHandler.beforeUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }else if(trigger.isdelete){
            ContactTriggerHandler.beforeDeleteTrigger(trigger.old,trigger.oldMap);
        }
    }else 
        if(trigger.isafter){
            if(trigger.isinsert){
                ContactTriggerHandler.afterInsertTrigger(trigger.new,trigger.newMap);
            }else if(trigger.isupdate){
                ContactTriggerHandler.afterUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
            }else if(trigger.isdelete){
                ContactTriggerHandler.afterDeleteTrigger(trigger.old,trigger.oldMap);
            }else if(trigger.isundelete){
                ContactTriggerHandler.afterUndeletTrigger(trigger.new,trigger.newMap);
            } 
        }
}