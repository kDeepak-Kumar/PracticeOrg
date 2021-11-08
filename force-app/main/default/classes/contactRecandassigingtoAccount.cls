public class contactRecandassigingtoAccount {

    public List<contact> creatingContactRec(Account accObj){
        List<contact> conList = new List<contact>();
        for(integer i=0;i<5;i++){
            contact conObj = new contact();
            conObj.lastname = 'Con with'+accObj;
            conObj.firstname = 'Created';
            conObj.phone = accObj.phone;
            conObj.accountid = accobj.id;
            conList.add(conObj);
        }
        if(!conList.isempty()){
            insert conList;
        }
        return conList;
    }
}