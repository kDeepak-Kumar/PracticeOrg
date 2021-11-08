public class JSON_Example {

    public list<integer> intValues {set;get;}
    public void JSON_ExampleMethod(){
        intValues = new list<integer>();
        string JSONString = '{"Name":"Deepak", "Phone":809706709, "City":"Hyderabad","Age":30}';
        JSONParser Jp = JSON.createParser(JSONString);
        while(Jp.nextToken() != null){
            if(Jp.getCurrentToken() == JSONToken.VALUE_NUMBER_INT){
                integer a = (integer)Jp.getIntegerValue();
                intValues.add(a);
            }
        }	
        system.debug('Integer Value::'+intValues);
    }
}