public class BatchClass implements database.Batchable<sObject>{
    
    Public static database.QueryLocator start(database.batchablecontext BC){
        
        string query = 'select id, Phone from account';
        return database.getqueryLocator(query);
    }
    
    public static void execute (database.BatchableContext bc, list<sObject> scope){
        list<account> accList = (list<account>)scope;
        for(account a:acclist){
            list<contact> conList= [select accountId, phone from contact where accountId =: a.Id];
            for(contact c:conlist){
                c.OtherPhone = a.Phone;
            }
            Update conList;
        }
    }
    
    public static void finish (database.BatchableContext bc){
        // Get the ID of the AsyncApexJob representing this batch job
        // from Database.BatchableContext.
        // Query the AsyncApexJob object to retrieve the current job's information.
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                          TotalJobItems, CreatedBy.Email
                          FROM AsyncApexJob WHERE Id =
                          :BC.getJobId()];
        // Send an email to the Apex job's submitter notifying of job completion.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Apex Sharing Recalculation ' + a.Status);
        mail.setPlainTextBody
            ('The batch Apex job processed ' + a.TotalJobItems +
             ' batches with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}