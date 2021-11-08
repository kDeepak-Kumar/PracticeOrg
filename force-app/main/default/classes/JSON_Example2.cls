public class JSON_Example2 {

    public list<decimal> values {set;get;}
    public void decimalValues(){
        this.values = new list<decimal>();
        string JSONString = '{"Name":"Deepak","Salary":25.50,"Interest":2.25;"Years":3.2}';
        JSONParser Jp = JSON.createparser(JSONString);
        while(Jp.nextToken() != null){
            if(Jp.getCurrentToken() == JSONTOKEN.VALUE_NUMBER_FLOAT){
                decimal a = (decimal)Jp.getDecimalValue();
                values.add(a);
            }
        }
        system.debug('Decimal Value'+values);
    }
}