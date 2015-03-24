@isTest(SeeAllData=true)

private class TestUpdateChildAccountOwner {

    static testMethod void updateChildAccountOwner() {
    //Create
        
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
            Business_Unit__c = 'Consumer Lowes'
        );
        insert u2;
        
    Account a1 = new Account(
      OwnerId = u1.ID,
      Name = 'Lowes of Kalamazoo',
      Account_Type__c = 'Lowes Store',
      Business_Unit__c = 'Consumer Lowes'
      );
    insert a1;
    
    Account a2 = new Account(
      OwnerId = u1.ID,
      Name = 'Tom Tom Painting',
      Account_Type__c = 'Pro Account',
      Business_Unit__c = 'Consumer Lowes',
      ParentID = a1.ID
      );
    insert a2;
    
    Contact c1 = new Contact(
      OwnerId = u1.ID,
      LastName = 'Smith',
      AccountID = a2.ID
      );
    Contact c2 = new Contact(
      OwnerId = u1.ID,
      LastName = 'Jones',
      AccountID = a2.ID
      );
      
    Contact c3 = new Contact(
      OwnerId = u1.ID,
      LastName = 'Williams',
      AccountID = a2.ID
      );
    insert new List<Contact>{c1, c2, c3};
        
    //Check*/
    test.startTest();
      
    a1.OwnerId = u2.ID;
    try{
        update a1;
    }catch(Exception e){
        System.debug(Logginglevel.INFO, '***** ERROR'+e.getMessage());
    }
    a2 = [select OwnerId FROM Account Where Name = 'Tom Tom Painting' Limit 1][0]; 
    System.assertEquals(a2.ownerID, u2.ID);
   // System.assertEquals(c1.ownerID, u2.ID);
   // System.assertEquals(c2.ownerID, u2.ID);
    //System.assertEquals(c3.ownerID, u2.ID);
   // System.assertEquals(t1.ownerID, a2.OwnerID);
    test.stopTest();
     
    }
    
}