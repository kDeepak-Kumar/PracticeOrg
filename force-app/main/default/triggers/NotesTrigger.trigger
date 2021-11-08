trigger NotesTrigger on Note (after insert) {

    if(trigger.isafter && trigger.isinsert){
        NoteTriggerHandlerApex.afterInsertTrigger(trigger.new);
    }
}