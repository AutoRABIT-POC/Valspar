@isTest
private class TestPopulateBusinessUnitOnOpportunity {

    static testMethod void populateBusinessUnitOnOpportunityNotNull() {
        
        //Create
        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Automotive';
        update u;
        Account acct = new Account(Name='Test Acct');
        insert acct;
        Opportunity opp = new Opportunity(Name='Test Opp', AccountId=acct.Id, CloseDate=system.Today(), StageName='Qualification', Annual_Expected_Revenue__c=1);
        
        //Invoke
        insert opp;
        
        //Check
        Opportunity o = [SELECT Id, Business_Unit__c FROM Opportunity WHERE Id = :opp.Id LIMIT 1];
        system.assertEquals(u.Business_Unit__c, o.Business_Unit__c);
    }
    
    static testMethod void populateBusinessUnitOnOpportunityNull() {
        
        //Create
        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = NULL;
        update u;
        Account acct = new Account(Name='Test Acct');
        insert acct;
        Opportunity opp = new Opportunity(Name='Test Opp', AccountId=acct.Id, CloseDate=system.Today(), StageName='Qualification', Annual_Expected_Revenue__c=1);
        
        //Invoke
        insert opp;
        
        //Check
        Opportunity o = [SELECT Id, Business_Unit__c FROM Opportunity WHERE Id = :opp.Id LIMIT 1];
        system.assertEquals(u.Business_Unit__c, o.Business_Unit__c);
    }
}