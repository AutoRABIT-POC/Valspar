// *********************************************************************************************
// Filename:        BatchCaseArticleScanScheduler
// Author:          Etherios Inc.
// Date Created:    11/26/2013
// Description:     BatchCaseArticleScanScheduler schedules ScheduledBatchCaseArticleScan to run hourly 
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
global class BatchCaseArticleScanScheduler {
	public static void start() {
		//Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
		System.schedule('CaseArticle Scan on the Hour', '0 0 * * * ?', new ScheduledBatchCaseArticleScan());
	}
}