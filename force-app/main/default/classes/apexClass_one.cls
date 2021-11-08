public class apexClass_one {

    public integer a;
    public static integer b;
    public string variableName{
        set{
            variableName = value + 'kumar';
        }
        get{
            return  variableName;
        }
    }
    
    public void display(){
        system.debug('this is non static method');
    }
    public static void showMe(){
        system.debug('this is static method of Show Me method');
    }
    public integer sum(integer a, integer b){
        integer c = a + b;
        return c;
    }
    public static integer multiplication(integer a, integer b){
        integer multiplyingValue = a * b ;
        return multiplyingValue;
    }
    public void accessingOtherClass(){
        apexClass_Two Obj = new apexClass_Two();
        obj.show();
        integer divisionResult = apexClass_Two.division( 100, 50);
        system.debug('Displaying other class Division Result ::'+divisionResult);
    }
    public void invokeMethod(){
        showMe();
        system.debug('i had invoked showMe() method ');
    }
}