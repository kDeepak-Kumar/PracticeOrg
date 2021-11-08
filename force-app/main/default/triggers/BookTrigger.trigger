trigger BookTrigger on Book__c (after insert) {

    public static Integer size = trigger.new.size();
    if(trigger.isafter && trigger.isInsert){
        Book_cTriggerHandler.afterInsertTrigger(trigger.new,trigger.newMap);
    }
}