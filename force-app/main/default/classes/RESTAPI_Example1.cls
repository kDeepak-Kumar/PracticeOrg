@RestResource(urlMapping='/createLead/*')
global class RESTAPI_Example1 {
    @httpPost
    global static string create(string lastName, string Company, string phone){
        
        system.JSONGenerator Jp = JSON.createGenerator(true);
        JP.writeStartObject();
        try{
            Lead l = new Lead();
            l.LastName = lastName;
            l.Company = company;
            l.Phone = '0123-1234';
            l.Status = 'Open-Not Contacted';
            insert l;
            Jp.writeStringField('Status', 'Success');
            Jp.writeStringField('Lead ID', l.Id);
        }catch(exception e){
            jp.writeStringField('status', 'Insertion Failed');
            jp.writeStringField('Exception', e.getTypeName());
        }
        JP.writeEndObject();
        string result = Jp.getAsString();
        return result;
        
    }
}