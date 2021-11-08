trigger FeedTrigger on FeedItem (before insert) {
     //This loop blocks new posts with attachments
    for (FeedItem item : Trigger.new) {
        //if(item.RelatedRecordID!=null){
            item.addError('Feed Item Uploading of attachments are currently disabled until further notice. Please cancel your current Chatter post. - system admin');
        //}
    }
}