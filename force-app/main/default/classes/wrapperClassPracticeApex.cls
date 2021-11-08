public class wrapperClassPracticeApex {
    
    public static wrapperInnerClass  displayReturnValues(integer numb, string value){
        integer a = numb;
        string fName = value;
        account accRecord = [select id from account limit 1];
        list<opportunity> oppListRecords = [select id from opportunity limit 3];
        
        //invoking wrapperInnerClass
        
        wrapperInnerClass wrapObj = new wrapperInnerClass();
        wrapObj.intVal = a;
        wrapObj.firstName = fName;
        wrapObj.accRec = accRecord;
        wrapObj.oppList = oppListRecords;
        
        return wrapObj;
    }
    
    public class wrapperInnerClass{
        
        integer intVal {get;set;}
        string firstName {get;set;}
        account AccRec {get;set;}
        List<opportunity> oppList {get;set;}
    }
    
}