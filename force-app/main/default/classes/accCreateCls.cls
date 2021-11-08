public Class accCreateCls{
    
    public wrapping digital(){
        integer nu = 25;
        string name = 'sravya';
        account accObj = [select id from account limit 1];
        list<contact> contList = [select id, phone from contact where phone !=null limit 3];
        //invoking//
        wrapping wrap = new wrapping();
        wrap.numerator = nu;
        wrap.namam = name;
        wrap.katha = accObj;
        wrap.contObjList = contList;
        
        return wrap;
   
            }
    public class wrapping{
        integer numerator {get;set;}
        string namam {get;set;}
        account katha {get;set;}
        list<contact> contObjList = new list<contact>();
        
        
        
    }
}