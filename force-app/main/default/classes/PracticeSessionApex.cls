/* Organization : Swhizz Tech .. !!
 * Descripiton  : This class is about method Decleration
 * Last modified by
   ======================================================
	S No. 	Date 		Name		Changes
   ======================================================
	1.		25-11-2019	K.Deepak	Initial draft
*/

public class PracticeSessionApex {
	
    //non static 0 param method
    public void display(){
        system.debug('Displaying text message ...!');
    }
    
    //non static 2 param method
    public void addition(integer a, integer b){
        integer c = a + b;
        system.debug('addition'+c);      
    } // end of addition method
    
    //create contact reocords 
    public void contactrecord(string lname, string fname, string phone){
        contact conObj = new contact ();
        conObj.lastname = lname;
        conObj.firstname = fname;
        conObj.phone = phone;
        insert conObj; // DML statement
        system.debug('created one contact object ::' + conObj);
    } // end of contactrecord method
    
    //create multiple records in campaign object
    public void campaignrecords(string name, string status){
        list<campaign> camList = new list<campaign>();
        for(integer i=0;i<5;i++){
            campaign camObj = new campaign();
            camObj.name = name;
            camObj.status = status;
            camList.add(camObj);
        }  
        insert camList;
        for(campaign Cam:camList){
            system.debug('campaign records::'+cam);
        }           
    } // end of campaignrecords method
    
    //retreving opportunites data through query
    public void OppRecords(){
        list<opportunity> OppRec = [select id, name, closedate from opportunity limit 10];
        for(opportunity opp:oppRec){ // for each
            system.debug('opportunity reocords::'+opp);
        }        
    } // end of oppRecords method

	// static method o param method
    public static void display2(){
        system.debug('this is Static method with Zero param method');
    }// end of Display2 method
    
    // static method with return value
    public static integer multiplication(integer a, integer b){
        integer c = a*b;
        return c;
    } // end of multiplication method with retun value of static         
}