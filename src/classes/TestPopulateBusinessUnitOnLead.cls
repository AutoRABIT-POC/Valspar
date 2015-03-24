@isTest
private class TestPopulateBusinessUnitOnLead {

    static testMethod void populateBusinessUnitOnLeadNotNull() {
        
        //Create
        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Automotive';
        update u;
        Lead lead = new Lead(LastName='Test Lead', Company='Test');
        
        //Invoke
        insert lead;
        
        //Check
        Lead l = [SELECT Id, Business_Unit__c FROM Lead WHERE Id = :lead.Id LIMIT 1];
        system.assertEquals(u.Business_Unit__c, l.Business_Unit__c);
    }
    
    static testMethod void populateBusinessUnitOnLeadNull() {
        
        //Create
        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = NULL;
        update u;
        Lead lead = new Lead(LastName='Test Lead', Company='Test');
        
        //Invoke
        insert lead;
        
        //Check
        Lead l = [SELECT Id, Business_Unit__c FROM Lead WHERE Id = :lead.Id LIMIT 1];
        system.assertEquals(u.Business_Unit__c, l.Business_Unit__c);
    }
}