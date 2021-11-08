/* Organisation: Swihzz Tech 
 * Description of Apple X product
 ========================================
 S No.  Name		Date		Changes
 ========================================
 1.		Deepak		23-11-2019	
*/

public class appleIphone {
	//properties
	string nameandmodel = 'Apple X';
    string storage = '64 GB';
    Double price = 100000.10;
    date purchaseddate = date.newInstance(2018, 12, 22);
    
    //Behaviour
    public void makeCalls(){
        system.debug('Can Make calls ');
    } // end of makeCalls method
    public void sendMessages(){
        system.debug('can Send Messages');
    } // end of SendMessage method
    public void phoneInformation(){
        system.debug('Phone name and model ::'+nameandmodel);
        system.debug('phone Storage::'+storage);
        system.debug('Purchased Date ::'+purchaseddate);
    } // end of phoneInformation method
 } // end of class appleIphone