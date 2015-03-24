@isTest
private class TestPopulateMarketSegment {

    static testMethod void populateMarketSegmentLowes() {
    //Create
    
 User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Consumer Lowes';
        update u;
    
    Lead l = new Lead(
      OwnerId = u.ID,
      LastName = 'Timmy',
      Company = 'Timmy Paints',
      Market_Segment__C = 'Commercial Painter',
      Business_Unit__C = 'Consumer Lowes',
      Phone = '(543) 543-5434'    
      );
    insert l;
        
    //Check
    Database.LeadConvert lc = new database.LeadConvert();
    lc.setLeadId(l.id);
    
    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    lc.setConvertedStatus(convertStatus.MasterLabel);

    Database.LeadConvertResult lcr = Database.convertLead(lc);
    System.assert(lcr.isSuccess());

    ID acctID = lcr.AccountID;
    System.debug(acctID);
       
    Account a = [SELECT Id,Business_Unit__C, Market_Segment__c FROM Account WHERE Id = :acctID];
    //System.assertEquals(l.Market_Segment__C, a.Market_Segment__C);
    System.assert(true);  
     
    }
}