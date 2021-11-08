trigger AssetTrigger on Asset (after Update) {
	
    set<id> oldAccIdSet = new set<id>();
    set<string> newAccIdSet = new set<string>();
    if(trigger.isafter && trigger.isUpdate){
        for(asset aNew:trigger.new){
            asset aOld = trigger.OldMap.get(aNew.id);
            if(aNew.AccountId != aOld.AccountId){
                oldAccIdSet.add(aOld.AccountId);
                newAccIdSet.add(aNew.AccountId);
                //delete [select accountId from contact where accountId =:aOld.AccountId];
            }
        }
        list<contact> conList = [select id, accountId from contact where accountId=: oldAccIdSet];
        list<contact> updatedContactList = new list<contact>();
        for(contact con:conList){
            for(string i:newAccIdSet){
                if(con.AccountId == i){
                    con.AccountId = 'i';
                    updatedContactList.add(con);
                    system.debug('Entering 21st Line');
                }
            }
        }
        for(asset aNew:trigger.new){
            asset aOld = trigger.OldMap.get(aNew.id);
            if(aNew.AccountId != aOld.AccountId){
                Update updatedContactList;
                system.debug('Entering 29th line');
                //delete conList;
            }
        }
     }
}