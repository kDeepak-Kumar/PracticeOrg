public with sharing class AccountHomePageController {

    public list<selectOption> Records { get; set; }

    public String Filter { get; set; }
    
    public list<account> accRecords { get; set; }
    
    public AccountHomePageController (){
    
        accRecords  = new list<account>();
        Records = new list<selectOption>();
        Records.add(new SelectOption('All Accounts','All Accounts'));
        Records.add(new SelectOption('Active Accounts','Active Accounts'));
        Records.add(new SelectOption('InActive Accounts','InActive Accounts'));
        filter = 'All Accounts';
        filter = 'Active Accounts';
        filter = 'InActice Accounts';
    }
    
    public list<account> getAcccountRecordsMethod(){
        
        if(filter == 'All Accounts'){
            accRecords = [select id, name , phone, Active__c from account];
        }
        else
            if(filter == 'Active Accounts'){
                    accRecords = [select id, name , phone, Active__c from account where Active__C = 'yes'];
            }
            
        else
            if(filter == 'Active Accounts'){
                accRecords = [select id, name , phone, Active__c from account where Active__C = 'No'];
        }
        
        return accRecords ;
    }
    
    public PageReference ShowRecords() {
        return null;
    }


    
    
    
}