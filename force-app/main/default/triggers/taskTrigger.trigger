trigger taskTrigger on Task (after insert, after Update) {

    if(trigger.isafter && trigger.isUpdate){
        LeadTriggerHandler.afterUpdate(trigger.newMap , trigger.oldMap);
    }
    
}