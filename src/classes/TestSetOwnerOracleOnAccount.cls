@isTest
private class TestSetOwnerOracleOnAccount {

    static testMethod void testTrigger() {
        //Setup
		string loggedOnUserID;
		string testUserID;
		final string EMP_NUM_1 = '987654321ABC';
		final string EMP_NUM_2 = '987654321ABCDEFG';
	    Account a = new Account();
	    
	    //'Oracle Mastered'
	    loggedOnUserID = userInfo.getUserID();
	    string recordTypeId = '';
	    string recordTypeId2 = '';
	    list<RecordType> aList = [select id 
		     				from RecordType 
		        			where Name = 'Integrated Account' and SobjectType = 'Account'];
	    
		  if (aList.isEmpty()){
		  	//This record type must exist
		  	system.assertEquals('Integrated Account', 'Does not exist');
		  }else{
		    recordTypeId = aList[0].ID;
		  }
		  
		  aList = [select id 
		     				from RecordType 
		        			where Name = 'Manual Account' and SobjectType = 'Account'];
	    
		  if (aList.isEmpty()){
		  	//This record type must exist
		  	system.assertEquals('Manual Account', 'Does not exist');
		  }else{
		    recordTypeId2 = aList[0].ID;
		  }
		  
		  User myLoggedOnUser = [Select ID, EmployeeNumber
		         From User
		         Where ID = :loggedOnUserID];
		  myLoggedOnUser.EmployeeNumber = EMP_NUM_2;
		  update myLoggedOnUser;
	      
	  	Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
		
		User testUser = new User();
		testUser.Email = 'test@test.com';
		testUser.LastName = 'Test Authenticated User';
		testUser.Alias = 'tau';
		testUser.Username = 'testAuthenticatedUser@test.com';
		testUser.CommunityNickname = 'TEST_testAuthenticatedUser@test.com';
		testUser.emailencodingkey = 'UTF-8';
		testUser.localesidkey = 'en_US';
		testUser.languagelocalekey = 'en_US';
		testUser.timezonesidkey = 'America/Los_Angeles';
		testUser.ProfileId = p.Id;
		testUser.EmployeeNumber = EMP_NUM_1;
		
		insert testUser;
	    testUserID = testUser.id;
	    
	    //Test
	    test.startTest();
	    a.Name = 'MyTest';
	    a.RecordTypeId = recordTypeID;
	    a.employee_number__c = EMP_NUM_1;
	    //This should insert as current user, which is not testUser.  
	    // The trigger should change the owner to the testUser
	    insert a;
	    	    
	    Account a2 = [Select ID, Owner.EmployeeNumber, OwnerID From Account Where ID = :a.ID];
	    system.assertNotEquals(a2.ID, null);
	    system.assertEquals(a2.OwnerID, testUserID);
	    system.assertEquals(a2.Owner.EmployeeNumber, EMP_NUM_1);
	    
	    //Now try to change the owner to the logger on user
	    a.Owner = myLoggedOnUser;
	    a.OwnerID = myLoggedOnUser.id;
	    a.Industry = 'Sales';
	    update a;
	    	                    
	    //Check Owner and it should be back to the testUser
	    a2 = [Select ID, Owner.EmployeeNumber, OwnerID From Account Where ID = :a.ID];
	    system.assertNotEquals(a2.ID, null);
	    system.assertEquals(a2.OwnerID, testUserID);
	    system.assertEquals(a2.Owner.EmployeeNumber, EMP_NUM_1);
	    
	    //Now try to change the owner to the logger on user
	    a.Owner = myLoggedOnUser;
	    a.OwnerID = myLoggedOnUser.id;
	    a.RecordTypeId = recordTypeID2;
	    a.Industry = 'Sales';
	    update a;
	    
	    a2 = [Select ID, Owner.EmployeeNumber, OwnerID From Account Where ID = :a.ID];
	    system.assertNotEquals(a2.ID, null);
	    system.assertEquals(a2.OwnerID, loggedOnUserID);
	    system.assertEquals(a2.Owner.EmployeeNumber, EMP_NUM_2);
	    
	    test.stopTest();
    }
}