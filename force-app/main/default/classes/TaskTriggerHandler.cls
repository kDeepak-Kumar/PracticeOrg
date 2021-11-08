public class TaskTriggerHandler {

    Public static void afterUpdate( map<id,task> taskNewMap, map<id,task> taskOldMap){
        set<id> keys = taskOldMap.keyset();
        for(ID K:keys){
            task old = taskOldMap.get(k);
            task newValue = taskNewMap.get(K);
            if(old.Status != 'completed' && newValue.Status =='completed'){
                account acc = [select id, Description from account where ID =: newValue.whatId];
                acc.description = 'Task Status Updated and Fired using trigger';
                Update acc;
            }
        }
    }
}