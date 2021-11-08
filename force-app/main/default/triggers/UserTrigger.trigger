trigger UserTrigger on User (before insert, after insert, after update) {

    if(Trigger.isafter && Trigger.isinsert){
        userTriggerHandler.afterInsert(trigger.new, trigger.oldMap);
    }else if(trigger.isafter && trigger.isUpdate){
        userTriggerHandler.afterUpdate(Trigger.new, trigger.oldmap);
    }
}