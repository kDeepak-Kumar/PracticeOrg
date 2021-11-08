trigger CampaignTrigger on Campaign (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
    if(trigger.isbefore){
        if(trigger.isinsert){
            CampaignTriggerApex.beforeInsertTrigger(trigger.new);
        }else if(trigger.isupdate){
            CampaignTriggerApex.beforeUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        }else if(trigger.isdelete){
            CampaignTriggerApex.beforeDeleteTrigger(trigger.old,trigger.oldMap);
        }
    }else 
        if(trigger.isafter){
            if(trigger.isinsert){
                CampaignTriggerApex.afterInsertTrigger(trigger.new,trigger.newMap);
            }else if(trigger.isupdate){
                CampaignTriggerApex.afterUpdateTrigger(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
            }else if(trigger.isdelete){
                CampaignTriggerApex.afterDeleteTrigger(trigger.old,trigger.oldMap);
            }else if(trigger.isundelete){
                CampaignTriggerApex.afterUndeletTrigger(trigger.new,trigger.newMap);
            } 
        }
}