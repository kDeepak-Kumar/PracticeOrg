/* Organisation: Swihzz Tech 
 * Description of Elevator
 ========================================
 S No.  Name		Date		Changes
 ========================================
 1.		Deepak		23-11-2019	
*/

public class elevatorApex {
	
    //properties
    string elevatorCompany = 'Hitachi';
    string Size = '5 x 5'; //feet
    integer height = 8; //feet
    
    //behaviour
    public void capacity(){
        system.debug('maximum capacity of elevator is 5 pepole or 400 kgs');
    } // end of capacity method
    public void speedOfElevator(){
        system.debug('it moves 5 meters in 30 seconds ');
    } // end of speedOfElevator method
    public void elevatorInformation(){
        system.debug('name of Elevator company::'+elevatorCompany);
        system.debug('size of Elevator length/width::'+size);
    } // end of elevatorInformation method
} // end of class elevatorApex