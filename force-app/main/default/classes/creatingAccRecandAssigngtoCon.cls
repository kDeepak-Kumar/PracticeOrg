public class creatingAccRecandAssigngtoCon {
    
    public void createAccrecord(){
        Account acc = new Account();
        acc.name = 'Account ';
        acc.phone = '8099706709';
        insert acc;
        if(acc != null){
            contactRecandassigingtoAccount var = new contactRecandassigingtoAccount();
            List<contact> conResult = var.creatingContactRec(acc);
            for(Contact C:conResult){
                system.debug('Printing Contact Records::'+C);
            }
            
        }
    }
}