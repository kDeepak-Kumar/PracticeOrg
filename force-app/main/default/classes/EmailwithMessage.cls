public class EmailwithMessage {
public pageReference Send()
{
    messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
        String[] toaddress = new String[] {'deepakkumar.nani22@gmail.com'};
            msg.setToAddresses(toaddress);
    String[] CcAddress = new String[] {'deepakkumar.nani22@gmail.com'};
        msg.setCcAddresses(CcAddress);
    String[] BccAddress = new String[] {'deepakkumar.nani22@gmail.com'};
        msg.setBccAddresses(BccAddress);
    msg.setSubject('Email Initialisation With only Text Body');
    msg.setPlainTextBody('Testing the Email Initialisation With only Text Body.');
    
        messaging.sendEmail(new messaging.SingleEmailMessage[]{msg});   
            return null;            
}
}