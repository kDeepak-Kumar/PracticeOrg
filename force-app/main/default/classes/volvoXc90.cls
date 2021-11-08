/* Organisation: Swihzz Tech 
 * Description of volvo Car XC 90
 ========================================
 S No.  Name		Date		Changes
 ========================================
 1.		Deepak		23-11-2019	
*/

public class volvoXc90 {
	
    //properties
    string carNameandModel = 'volvo XC 90';
    string cost = 'one crore';
    integer millage = 40;
    string color = 'white';
    
    //behavior 
    public void fourWheelcar(){
        system.debug('It is a 4 X 4 wheel drive car');
    } // end of 4Wheelcar metod
    public void carInformation(){
        system.debug('car name and model'+carNameandModel);
        system.debug('millage of XC 90'+millage);
        system.debug('color of Car ::'+color);
    } // end of carInformation method      
}