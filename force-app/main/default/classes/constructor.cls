public class constructor {

    
    public constructor(){ // zero param
        system.debug('Zero param Constructor');
    }
    
    public constructor(string name, integer a){ // one param
        string firstname = name;
        system.debug(''+firstname);
    }
    
    public constructor(integer a, string name){ // one param
        string firstname = name;
        system.debug(''+firstname);
    }
    
}