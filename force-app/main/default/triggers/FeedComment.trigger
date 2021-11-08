trigger FeedComment on FeedComment (before insert) {
    //This loop blocks new posts with attachments
    for (FeedComment item : Trigger.new) {
        if(item.RelatedRecordID!=null){
            item.addError('Feed Comment Uploading of attachments are currently disabled until further notice. Please cancel your current Chatter post. - system admin');
        }
    }
}