public with sharing class EmployeeScenarioPageController {

    public Employee__c EmployeeRecords {get;set;}
    public list<Employee__C> AlternateEmployeeRec {get;set;}
    
    public EmployeeScenarioPageController (){
        EmployeeRecords  = new Employee__C(); 
        AlternateEmployeeRec = new list<Employee__C>(); 
        getEmployeeRec(); 
    }
    
    public list<Employee__C> getEmployeeRec() {        
        
        //PageReference pRef = new PageReference ('/apex/EmployeeScenarioVFPage2');
        AlternateEmployeeRec = [select Name,firstName__c, LastName__c from Employee__C];        
        return AlternateEmployeeRec ;
    }
    
    public PageReference InsertTheRecord() {
        insert EmployeeRecords   ;
        PageReference pRef = new PageReference ('/'+EmployeeRecords.id);
        return pRef;
    }
    
    public PageReference NextPage() {        
        return Page.EmployeeScenarioVFPage2;
    }
    
    public PageReference PreviousVFPage() {
        return page.EmployeeScenarioVFPage1;
    }

}