public class Attachments_Controller_Apex {
	@auraEnabled
    public static string ApexMethod(string name, string phone, string industry ){
        account acc = new account();
        acc.Name = name;
        acc.Phone =phone;
        acc.Industry = industry;
        insert acc;
        string result = 'Insertion Successful';
        return result;
    }
}