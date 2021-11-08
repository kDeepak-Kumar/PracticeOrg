public class outerWrapperClass {
    
    public static innerWrapperClass returningResults(string fname, integer myAge){
        
        string name = fname;
        integer age = myAge;
        account accRecord = [select id from account limit 1];
        list<contact> conListRecords = [select id, phone from contact where phone != null limit 3];
               
        //initialising inner Wrapper class
        innerWrapperClass wrapObjClass = new innerWrapperClass();
        wrapObjClass.nameVar = name;
        wrapObjClass.myAge = age;
        wrapObjClass.accRecords = accRecord;
        wrapObjClass.conList = conListRecords;
        
        return wrapObjClass;        
    }
    
    public class innerWrapperClass{
        
        string nameVar{get;set;}
        integer myAge{get;set;}
        account accRecords {get;set;}
        list<contact> conList = new list<contact>();
    }    
}