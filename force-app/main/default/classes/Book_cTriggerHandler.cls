public class Book_cTriggerHandler {

    public static integer count = 0;
    public static boolean RecursiveFlag = false;
    public static void afterInsertTrigger(list<Book__c> newBook, map<id,Book__c> NewBookMap){
        
        if(RecursiveFlag == false){
            count = count+newBook.size();
        for(Book__C BookEach:newBook){
        Note NoteObj = new Note(Title='Testing trigger 002',parentId=BookEach.id);
        insert NoteObj;
        }
    }
        }
        
}