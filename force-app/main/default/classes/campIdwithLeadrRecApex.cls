public class campIdwithLeadrRecApex {
    
    public static campaign camId(){
        return [select id from campaign limit 1];
    }

}