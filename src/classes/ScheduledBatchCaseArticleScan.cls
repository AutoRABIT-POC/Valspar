// *********************************************************************************************
// Filename:        ScheduledBatchCaseArticleScan
// Author:          Etherios Inc.
// Date Created:    11/26/2013
// Description:     ScheduledBatchCaseArticleScan implements the schedulable interface for BatchCaseArticleScan
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
global class ScheduledBatchCaseArticleScan implements Schedulable {
    global void execute(SchedulableContext context) {                    
        BatchCaseArticleScan batchProcess = new BatchCaseArticleScan();
        Database.executeBatch(batchProcess);                    
    }
}