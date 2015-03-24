// *********************************************************************************************
// Filename:        BatchCaseArticleScan
// Author:          Etherios Inc.
// Date Created:    11/26/2013
// Description:     BatchCaseArticleScan is a batch process that sends recently added/modified CaseArticle records to the CaseUpdateLogic.updateCases() method 
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
global class BatchCaseArticleScan implements Database.Batchable<sObject> {
	
	public Datetime recently = Datetime.now().addMinutes(-60);
	public string batchQuery = 'SELECT Id, CreatedDate, SystemModstamp, CaseId FROM CaseArticle WHERE CreatedDate > :recently OR SystemModstamp > :recently';
	
	global Database.Querylocator start(Database.BatchableContext context) {
		return Database.getQuerylocator(batchQuery); 
	}
	
	global void execute(Database.BatchableContext context, List<CaseArticle> caseArticles) {
		CaseUpdateLogic.updateCases(caseArticles);  
	}
	
	global void finish(Database.BatchableContext context) {
		// No cleanup logic...
	}
}