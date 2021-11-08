trigger rollupSummFunctionality on Account (before insert) {
    
    if(trigger.isAfter & Trigger.isInsert){
        RUFunctionality_apex.afterInsert(Trigger.New);
    }
}