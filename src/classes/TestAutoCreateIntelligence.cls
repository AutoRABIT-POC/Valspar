@isTest
public class TestAutoCreateIntelligence{

    static testmethod void testCreateAI()
    {
        Integer count1 = [Select count() from Account_Intelligence__c];
        
    Account acc = new Account();
        acc.Name = 'test';
        acc.Business_Unit__c = 'Consumer Wattyl Trade';
        insert acc;
        
        Integer count2 = [Select count() from Account_Intelligence__c];
    
      System.AssertEquals(count1 + 1, count2);
    }
    
    static testmethod void testCreateCPAI()
    {
        Integer count3 = [Select count() from Channel_Partner_Account_Intelligence__c];
        
    Account acc = new Account();
        acc.Name = 'test';
        acc.Business_Unit__c = 'Consumer Masters';
        insert acc;
        
        Integer count4 = [Select count() from Channel_Partner_Account_Intelligence__c];
    
      System.AssertEquals(count3 + 1, count4);
    }
    
}