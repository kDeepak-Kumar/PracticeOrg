public class SobjectAndFieldsPickList_Apex {
    
	@auraEnabled
    public static list<Role__c> roleRecord(){
        return [select Id, Name, Description__c from Role__c];
    }  
    
    @auraEnabled
    public static string deleteRoleRecord(string roleRId){
        string result;
        try{
            delete [select Id from Role__c where Id =: roleRId];
            result ='Record Deleted Succesful';
        }catch(exception e){
            result='deletion Failed'+e.getTypeName();
        }
        return result;
    }
    @auraEnabled
    public static list<string> getobjNames()
    {
        string SobjectName;
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        List<string> options = new List<string>();
        for(Schema.SObjectType f : gd){
            if(!f.getDescribe().getName().contains('__')){
                SobjectName = f.getDescribe().getName();
                options.add(SobjectName);
            }
        }
        return Options;
    }
    @auraEnabled
    public static List<String> getFieldapis(string SobjectName) {
        
        // get the SObjectType
        Schema.SObjectType objectType = Schema.getGlobalDescribe().get(SobjectName);
        
        // get the fields on the object
        Map<String, SObjectField> fieldMap = objectType.getDescribe().fields.getMap();  
        
        // Get all of the fields on the object
        Set<String> fieldNames = fieldMap.keySet();
        
        list<string> fields = new list<string>();
        for(string f:fieldNames){
            fields.add(f);
        }
        return fields;
    }
}