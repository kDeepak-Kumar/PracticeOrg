global class CaseReOpenCtrl implements Messaging.InboundEmailHandler{
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
        
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        // Add the email plain text into the local variable 
        String myPlainText = email.plainTextBody;
        string subject = email.subject;
        boolean Re_Open;
        Integer caseNumberCount = 0;
        String caseNumber;
        string emailtype;
        system.debug('replyto@@'+email.references);
        
        Pattern p = Pattern.compile('\\d{8}+');
        Matcher m = p.matcher(email.Subject);
        while(m.find()){
            caseNumber = m.group();
        }
        
        if(subject.containsIgnoreCase(label.Case_Closed) && caseNumber != null && email.inReplyTo !=null){
            system.debug('subject - resolved');
            
            //collecting the keywords which decide to change the status of case to In-Progress
            list<Keywords_for_Case_Re_Open__mdt> Keywords = [select Label from Keywords_for_Case_Re_Open__mdt];
            for(Keywords_for_Case_Re_Open__mdt key:Keywords){
                if(myPlainText.containsIgnoreCase(key.Label)){                
                    Re_Open = True;
                    System.debug('key@@'+key.label);
                    break;
                }else{
                    Re_Open = false;
                }
            }
            system.debug('re-oepn@@'+Re_Open);
            if(Re_Open == True){ // enters this block if the keywork matches
                /* Pattern pat = Pattern.compile('([0-9]+)');
Matcher matcher = pat.matcher(subject);
Boolean matches = matcher.find(); // returns true if it has a Case Number 
if(matches == true){
caseNumber = matcher.group(1); 
for(String str : caseNumber.split(''))
{
Pattern ptn = Pattern.compile('\\d+');
Matcher m = ptn.matcher(str);
if(m.find()) {
caseNumberCount++;  
}
}
}*/
                //system.debug('matches@@'+matches);
                system.debug('caseNumber@@'+caseNumber);
                system.debug('caseNumberCount@@'+caseNumberCount);
                //system.debug('matcher@@'+matcher.group(1));
                //if(matches ==  true && caseNumber != null && caseNumberCount == 8){  
                    try{
                        case rec = [select id, Status, Subject, caseNumber from case where caseNumber =: caseNumber];
                        rec.Status = 'Re-Open';
                        update rec;
                    }catch(Exception e){
                        system.debug('Exception @@'+e.getMessage());
                    }
                //}
            }
        }
        return result;
    }
}