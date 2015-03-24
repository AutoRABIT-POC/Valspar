// *********************************************************************************************
// Filename:        BatchCaseArticleScanTest
// Author:          Etherios Inc.
// Date Created:    11/18/2013
// Description:     BatchCaseArticleScanTest tests the BatchCaseArticleScan process 
//                  
//
// Date     | Name                          | Task#     | Comments
// --------------------------------------------------------------------------------------------
// 11/26/2013   |aschultz@etherios.com          |           |File creation
// --------------------------------------------------------------------------------------------
// 
// Copyright 2013 Etherios Inc. All rights reserved. Customer confidential. Do not distribute.
// *********************************************************************************************
// *********************************************************************************************
@isTest
private class BatchCaseArticleScanTest {

    static testMethod void myUnitTest() {

        Case testCase = new Case();
        insert testCase;
        
        General_Inquiry_FAQ__kav article = new General_Inquiry_FAQ__kav(Title='Unit Test', UrlName = 'test');
        insert article;
        
        List<General_Inquiry_FAQ__kav> testArticle = [SELECT Id, KnowledgeArticleId FROM General_Inquiry_FAQ__kav WHERE Id = :article.Id];
        system.assert(testArticle.size() ==1);
        
        CaseArticle ca = new CaseArticle(CaseId = testCase.Id, KnowledgeArticleId =testArticle[0].KnowledgeArticleId);
        insert ca;
        
        List<CronTrigger> ct = [SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE CronExpression  = '0 0 * * * ?'];
        if (ct.size() < 1) {
        	BatchCaseArticleScanScheduler.start();
        	List<CronTrigger> newct = [SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE CronExpression  = '0 0 * * * ?'];
        	System.assert(newct.size() == 1);
        }
    }
    
    static testMethod void ScheduledBatchCaseArticleScanTest() {
        Case testCase = new Case();
        insert testCase;
        
        General_Inquiry_FAQ__kav article = new General_Inquiry_FAQ__kav(Title='Unit Test', UrlName = 'test');
        insert article;
        
        List<General_Inquiry_FAQ__kav> testArticle = [SELECT Id, KnowledgeArticleId FROM General_Inquiry_FAQ__kav WHERE Id = :article.Id];
        system.assert(testArticle.size() ==1);
        
        CaseArticle ca = new CaseArticle(CaseId = testCase.Id, KnowledgeArticleId =testArticle[0].KnowledgeArticleId);
        insert ca;    	
        ScheduledBatchCaseArticleScan scheduleTest = new ScheduledBatchCaseArticleScan();
        test.startTest();
        
        String schedule = '0 0 23 * * ?';
        system.schedule('Test', schedule, scheduleTest);
        
        test.stopTest();
    }    
}