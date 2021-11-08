trigger CaseTrigger on Case (before insert, after insert,before update, after update, before delete, after delete, after undelete) {

    if(trigger.isbefore){
        if(trigger.isinsert){
            CaseTriggerHandler.beforeInsertTrigger(trigger.new);
        }else if(trigger.isupdate){
            CaseTriggerHandler.beforeUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }else if(trigger.isdelete){
            CaseTriggerHandler.beforeDeleteTrigger(trigger.old,trigger.oldMap);
        } 
    }else 
        if(trigger.isafter){
            if(trigger.isinsert){
                CaseTriggerHandler.afterInsertTrigger(trigger.new,trigger.newMap);
            }else if(trigger.isupdate){
                CaseTriggerHandler.afterUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
            }else if(trigger.isdelete){
                CaseTriggerHandler.afterDeleteTrigger(trigger.old,trigger.oldMap);
            }else if(trigger.isundelete){
                CaseTriggerHandler.afterUndeletTrigger(trigger.new,trigger.newMap);
            } 
        }
}