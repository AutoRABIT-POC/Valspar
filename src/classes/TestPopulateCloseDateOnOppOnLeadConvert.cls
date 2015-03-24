/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TestPopulateCloseDateOnOppOnLeadConvert {

    static testMethod void PopulateCloseDateOnOppOnLeadConversion() {
        
        //Create
        Lead lead = new Lead(LastName='Test', Company='Test', Business_Unit__c='EPS', CurrencyISOCode='USD', Status='Unqualified');
        insert lead;
        
        //Invoke
        test.startTest();
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(lead.Id);
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted = true LIMIT 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        system.assert(lcr.isSuccess());
        test.stopTest();
        
        //Check
        id oppId = lcr.getOpportunityId();
        Opportunity opp = [SELECT Id, CloseDate FROM Opportunity WHERE Id = :oppId];
        system.assertEquals(system.today().addDays(5), opp.CloseDate);
    
    }
}