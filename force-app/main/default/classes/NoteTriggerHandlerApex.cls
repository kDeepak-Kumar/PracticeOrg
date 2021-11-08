public class NoteTriggerHandlerApex {

    public static integer count = 0;
    
    public static void afterInsertTrigger(List<Note> NewNote){
        
        count = count+newNote.size();
        for(note noteEach:newNote){
            Book__c bookObj = new Book__c(Name='New Book Check',Price__C=45);
            insert bookObj;
            
        }
    }
 boolean RecursiveFlag = Book_cTriggerHandler.RecursiveFlag;
           public static boolean RecursiveFlag = true;
}