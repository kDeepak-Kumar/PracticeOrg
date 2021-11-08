global class AccConRecords_Apex {

    @auraEnabled
    global static list<account> accRecords(){
        return [select Id, Name, Phone, Industry, Rating from account];
    }
    
    @auraEnabled
    global static list<contact> contactRecords(string accId){
        return [select Id,accountId, Name, Phone, Email, Description from contact where accountId =: accId];
    }
}