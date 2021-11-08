public class LeadTriggerHandler {

    Public static void afterUpdate( map<id,task> taskNewMap, map<id,task> taskOldMap){
        set<id> keys = taskOldMap.keyset();
        for(ID K:keys){
            task old = taskOldMap.get(k);
            task newValue = taskNewMap.get(K);
            if(old.Status != 'completed' && newValue.Status =='completed'){
                Lead L = [select id, Description from Lead where ID =: newValue.WhoId];
                L.description = 'Task Status Updated and Fired using trigger';
                Update L;
            }
        }
    }
}