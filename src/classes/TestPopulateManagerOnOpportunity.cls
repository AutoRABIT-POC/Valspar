@isTest
private class TestPopulateManagerOnOpportunity {

    static testMethod void populateManagerOnOpportunityNotNull() {
		//Create
		Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
		User user1 = new User(
			LastName = 'Test1',
			Email = 'test1@test.com',
			Alias = 'tuser1',
			CommunityNickname = 'tuser1',
			Username = 'test1@valspar.com',
			emailencodingkey = 'UTF-8',
    		localesidkey = 'en_US',
    		languagelocalekey = 'en_US',
    		timezonesidkey = 'America/Los_Angeles',
    		ProfileId = p.Id
		);
		insert user1;
		
		User user2 = new User(
			LastName = 'Test2',
			Email = 'test2@test.com',
			Alias = 'tuser2',
			CommunityNickname = 'tuser2',
			Username = 'test2@valspar.com',
			emailencodingkey = 'UTF-8',
    		localesidkey = 'en_US',
    		languagelocalekey = 'en_US',
    		timezonesidkey = 'America/Los_Angeles',
    		ProfileId = p.Id,
    		ManagerId = user1.Id
		);
		insert user2;
		
		Account a = new Account(Name='Test Account');
		insert a;
		
		Opportunity o = new Opportunity(
			OwnerId = user2.Id,
			AccountId = a.Id,
			Name = 'Test Opp',
			StageName = 'Qualification',
			CloseDate = system.today()
		);
		
		//Invoke
		insert o;
		
		//Check
		Opportunity testOpp = [SELECT Manager__c FROM Opportunity WHERE Id = :o.Id];
		system.assertEquals(user1.Id, testOpp.Manager__c);
    }
    
    static testMethod void populateManagerOnOpportunityNullManager() {
		//Create
		Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
		User user1 = new User(
			LastName = 'Test1',
			Email = 'test1@test.com',
			Alias = 'tuser1',
			CommunityNickname = 'tuser1',
			Username = 'test1@valspar.com',
			emailencodingkey = 'UTF-8',
    		localesidkey = 'en_US',
    		languagelocalekey = 'en_US',
    		timezonesidkey = 'America/Los_Angeles',
    		ProfileId = p.Id
		);
		insert user1;
		
		Account a = new Account(Name='Test Account');
		insert a;
		
		Opportunity o = new Opportunity(
			OwnerId = user1.Id,
			AccountId = a.Id,
			Name = 'Test Opp',
			StageName = 'Qualification',
			CloseDate = system.today()
		);
		
		//Invoke
		insert o;
		
		//Check
		Opportunity testOpp = [SELECT Manager__c FROM Opportunity WHERE Id = :o.Id];
		system.assertEquals(null, testOpp.Manager__c);
    }
}