public with sharing class AccConOppController {

   
    public account accountMethod { get; set; }
    public contact ContactInfo {get;set;}
     public Opportunity OppInfo {get;set;}
     
     public AccConOppController (){
     accountMethod = new Account();
     ContactInfo  = new Contact();
     OppInfo  = new Opportunity();     
     }
    
    public PageReference PreviousMethod() {
        //PageReference pRef = new PageReference('/apex/AccConOppVFPage1');
        //pRef.setRedirect(true);
        return page.AccConOppVFPage1;
    }

    public PageReference NextMethod2() {
        //PageReference pRef = new PageReference('/apex/AccConOppVFPage3');
        //pRef.setRedirect(true);
        return page.AccConOppVFPage3;
    }

    public PageReference Nextpagemethod() {
        //PageReference pRef = new PageReference('/apex/AccConOppVFPage2');
        //pRef.setRedirect(true);
        return page.AccConOppVFPage2;
    }
    
     public PageReference SavingTheRecord() {
        insert accountMethod;
        insert ContactInfo;
        insert OppInfo;
        PageReference pRef = new PageReference('/'+accountMethod.id);
        pRef.setRedirect(true);
        return pRef;
    }

    public PageReference PreviousPageMethod3() {
        ////PageReference pRef = new PageReference('/apex/AccConOppVFPage2');
        //pRef.setRedirect(true);
        return page.AccConOppVFPage2;
    }
    
   
}