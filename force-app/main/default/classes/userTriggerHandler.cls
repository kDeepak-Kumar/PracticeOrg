public class userTriggerHandler {
    
    public static void afterInsert(list<user> lstUser, map<id,user> oldUserMap){
        
    }
    public static void afterUpdate(list<user> lstUser, map<id,user> oldUserMap){
        set<Id> userIds = new set<Id>();
        for(user u:lstUser){
            user oldUser = oldUserMap.get(u.Id);
            if((u.ProfileId == system.label.Custom_Profile_Test) && (u.ProfileId <> oldUser.ProfileId)){
                userIds.add(u.Id);
            }
            
            AssignPermissionSet(userIds);
        }
        
    }
    public static void AssignPermissionSet(set<Id> AssignUserPS){
        list<PermissionSetAssignment> newPSA = new list<PermissionSetAssignment>();
        map<Id,set<Id>> permissionSetAssignment = new map<Id,set<Id>>();
        for(Permission_Set_Assignment__mdt psa: [select Permission_Set_Id__c from Permission_Set_Assignment__mdt]){
            permissionSetAssignment.put(psa.Permission_Set_Id__c, new set<Id>());
        }
        for(PermissionSetAssignment permissionSet:[SELECT AssigneeId,PermissionSetId FROM PermissionSetAssignment where AssigneeId IN: AssignUserPS and PermissionSetId IN: permissionSetAssignment.keySet()]){
            if(permissionSetAssignment.containsKey(permissionSet.PermissionSetId)){
                permissionSetAssignment.get(permissionSet.PermissionSetId).add(permissionSet.AssigneeId);
            }
        }
        
        for(Id us:AssignUserPS){
            for(Id psId:permissionSetAssignment.keyset()){
                if(!permissionSetAssignment.get(psId).contains(us)){
                    PermissionSetAssignment psaObj = new PermissionSetAssignment();
                    psaObj.AssigneeId = us;
                    psaObj.PermissionSetId = psId;
                    newPSA.add(psaObj);
                }
            }
        }
        insert newPSA;
        
        
        
        
        
        
        
        
        
        
        
        
    }
}