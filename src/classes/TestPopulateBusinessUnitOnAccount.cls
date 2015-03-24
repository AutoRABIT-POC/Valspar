@isTest
private class TestPopulateBusinessUnitOnAccount {

    static testMethod void populateBusinessUnitOnAccountNotNull() {
        
        //Create
        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Automotive';
        update u;
        Account acct = new Account(Name='Test Acct');
        
        //Invoke
        insert acct;
        
        //Check
        Account a = [SELECT Id, Business_Unit__c FROM Account WHERE Id = :acct.Id LIMIT 1];
        system.assertEquals(u.Business_Unit__c, a.Business_Unit__c);
    }
    
    static testMethod void populateBusinessUnitOnAccountNull() {
        
        //Create
        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = NULL;
        update u;
        Account acct = new Account(Name='Test Acct');
        
        //Invoke
        insert acct;
        
        //Check
        Account a = [SELECT Id, Business_Unit__c FROM Account WHERE Id = :acct.Id LIMIT 1];
        system.assertEquals(u.Business_Unit__c, a.Business_Unit__c);
    }
}