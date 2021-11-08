public with sharing class CustomController1 {

    public list<account> accList {get;set;} 
    public boolean IsActive {get;set;}
    public boolean IsInActive {get;set;}
       
    public void InActiveRecords() {
        accList = new list<account>();
        acclist = [select id, name, phone , Active__c from account where Active__c = 'No'];
        IsActive = false;
        IsInActive = true;
    }


    public void ActiveRecords() {
        accList = new list<account>();
        acclist = [select id, name, phone , Active__c from account where Active__c = 'yes'];
        IsActive = true;
        IsInActive = false;
        
    }

}