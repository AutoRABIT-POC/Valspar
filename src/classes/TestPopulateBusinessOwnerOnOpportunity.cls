@isTest
private class TestPopulateBusinessOwnerOnOpportunity {

    static testMethod void populateBusinessOwnerOnOpportunityNotNull() {
    Profile Lowes = [Select id from Profile where Name = 'Consumer Lowes Sales Managers and Marketing' limit 1];
        User u1 = new User(
            Alias = 'kirktest', 
            Email='standarduser@testorg.com',
            EmailEncodingKey='UTF-8',
            LastName='Testing',
            LanguageLocaleKey='en_US',
            LocaleSidKey='en_US',
            ProfileId = Lowes.Id,
            TimeZoneSidKey='America/Los_Angeles',
            UserName='kirktest@xyz.com',
            Business_Unit__c = 'Consumer Lowes'
        );
        insert u1;
             
        User u2 = new User(
            Alias = 'xyz', 
            Email='standarduser2@testorg.com',
            EmailEncodingKey='UTF-8',
            LastName='Testing2',
            LanguageLocaleKey='en_US',
            LocaleSidKey='en_US',
            ProfileId = Lowes.Id,
            TimeZoneSidKey='America/Los_Angeles',
            UserName='valspartest@xyz.com',
            Business_Unit__c = 'Consumer Lowes',
            ManagerID = u1.ID
        );
        insert u2;
        
    Account a1 = new Account(
      OwnerId = u2.ID,
      Name = 'Lowes of Kalamazoo',
      Account_Type__c = 'Lowes Store',
      Business_Unit__c = 'Consumer Lowes'
      );
    insert a1;
    
    Opportunity o1 = new Opportunity(
      Name = 'Opportunity 1',
      OwnerID = u2.id,
      Business_Unit__C = 'Consumer Lowes',
      AccountId = a1.id,
      CloseDate = system.today(),
      StageName = 'Qualification'
      );
      insert o1;
         
    //Check*/
    test.startTest();
      
    
    try{
        update o1;
    }catch(Exception e){
        System.debug(Logginglevel.INFO, '***** ERROR'+e.getMessage());
    }
    opportunity testopp = [select OwnerId, Business_Owner__C FROM Opportunity where Name = 'Opportunity 1']; 
    System.assertEquals(testopp.Business_Owner__C, u1.ID);
   // System.assertEquals(c1.ownerID, u2.ID);
   // System.assertEquals(c2.ownerID, u2.ID);
    //System.assertEquals(c3.ownerID, u2.ID);
   // System.assertEquals(t1.ownerID, a2.OwnerID);
    test.stopTest();
     
    }
    
}