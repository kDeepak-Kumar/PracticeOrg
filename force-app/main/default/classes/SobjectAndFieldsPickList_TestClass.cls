@isTest
public class SobjectAndFieldsPickList_TestClass {
    
    public static testMethod void roleRecordTest(){
        SobjectAndFieldsPickList_Apex.roleRecord();
        role__c r = new role__c();
        r.Name = 'Check';
        insert r;
        role__c role = [select id from Role__c where Id =: r.Id];
    }
    
    public static testMethod void deleteRoleRecordTest(){
        role__c r = new role__c();
        r.Name = 'Check';
        insert r;
        role__c role = [select id from Role__c where Id =: r.Id];
        delete role;
        SobjectAndFieldsPickList_Apex.deleteRoleRecord(role.Id);
    }
    
    public static testMethod void getobjNamesTest(){
        SobjectAndFieldsPickList_Apex.getobjNames();
    }
    public static testMethod void getFieldapisTest(){
        string SobjectName;
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();
        List<string> options = new List<string>();
        for(Schema.SObjectType f : gd){
            if(!f.getDescribe().getName().contains('__')){
                SobjectName = f.getDescribe().getName();
                options.add(SobjectName);
            }
        }
        SobjectAndFieldsPickList_Apex.getFieldapis(SobjectName);
    }
    
    
}