trigger ContactTrigger_Trg on Contact (after insert, after Update, after delete,after Undelete) {
    
        if(trigger.isInsert || trigger.isUndelete){
            AnnualRevenue_Apex.afterInsert(trigger.new);
        }else
        if(trigger.isUpdate){
            AnnualRevenue_Apex.afterUpdate(trigger.newMap, trigger.oldMap);
        }
        if(trigger.isDelete){
            AnnualRevenue_Apex.afterDelete(trigger.old);
        }
    
}