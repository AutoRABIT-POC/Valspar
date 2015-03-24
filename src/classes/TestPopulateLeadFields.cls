@isTest
private class TestPopulateLeadFields {

    static testMethod void populateLeadFields() {
    //Create
    
    User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
    system.debug('### u = ' + u);
    u.Business_Unit__c = 'Consumer Lowes';
    update u;
   
    Account pa = new Account(
    Name = 'Lowes of Kalamazoo', 
    Account_Type__C = 'Lowes Store',
    OwnerID = u.id
    );
    
    insert pa;
    pa.Account_Type__C = 'Lowes Store';
    update pa;
    
    Account testAccount = [Select Id, Name, Account_Type__c From Account Limit 1];
    system.debug('### testAccount = ' + testAccount );
    
    system.debug('### pa.id = ' + pa.id);
    Lead l = new Lead(
      OwnerId = u.ID,
      LastName = 'Timmy',
      Company = 'Timmy Paints',
      Market_Segment__C = 'Commercial Painter',
      Est_Annual_Revenue__C = 15000,
      Global_Region__C = 'Mexico',
      Business_Unit__C = 'Consumer Lowes',
      Phone = '(543) 543-5434',
      Geo_Region__C = 'GELCOAT',
      Store__C = pa.ID
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
       
    Account a = [SELECT Id,Business_Unit__C, ParentID, AnnualRevenue, Global_Region__C, Market_Segment__C, Geo_Region__C FROM Account WHERE Id = :acctID];
    System.assertEquals(l.Store__C, a.ParentID);  
    System.assertEquals(l.Est_Annual_Revenue__C, a.AnnualRevenue);
    System.assertEquals(l.Global_Region__C, a.Global_Region__C);
    System.assertEquals(l.Market_Segment__C, a.Market_Segment__C);
    System.assertEquals(l.Geo_Region__C, a.Geo_Region__C);     
    }
  
/*  
  static testMethod void populateLowesProParentNotLowes() {
    //Create
    
 User u2 = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u2.Business_Unit__c = 'Consumer DB';
        update u2;
        
    Account pa = new Account(
    Name = 'Kalamazoo',
    Business_Unit__C = 'Consumer DB',
    //Account_Type__C = 'Lowes Store',
    ownerid = u2.id
    );
    
    insert pa;
    
    Lead l2 = new Lead(
      OwnerId = u2.ID,
      LastName = 'Timmy',
      Company = 'Timmy Paints',
      Market_Segment__C = 'Commercial Painter',
      Business_Unit__C = 'Consumer DB',
      Phone = '(543) 543-5434'
      );
    insert l2;
        
    //Check
    Database.LeadConvert lc = new database.LeadConvert();
    lc.setLeadId(l2.id);
    
    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    lc.setConvertedStatus(convertStatus.MasterLabel);

    Database.LeadConvertResult lcr = Database.convertLead(lc);
    System.assert(lcr.isSuccess());

    ID acctID = lcr.AccountID;
    System.debug(acctID);
       
    Account a = [SELECT Id,Business_Unit__C, ParentID FROM Account WHERE Id = :acctID];
    System.assertEquals(null, a.ParentID);  
     
    }  
    */
}