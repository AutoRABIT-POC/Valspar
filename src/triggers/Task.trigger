// *********************************************************************************************
// Filename:        Task.trigger
// Author:          Etherios Inc.
// Date Created:    11/18/2013
// Description:     The After trigger sends Case Ids to CaseUpdateLogic.updateCases for an update to the parent Case record 
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
trigger Task on Task (after delete, after insert, after undelete, after update) {
    //After trigger sends caseIdsToUpdate to CaseUpdateLogic.updateCases.  '500' is the first 3 characters of any Case Id
    if (trigger.isAfter) {
        Set<Id> caseIdsToUpdate = new Set<Id>();
        Set<id> tasksToInsert = new Set<id>();
        
        if (Trigger.isDelete) {
            for (Task e : Trigger.old) {
                String id = e.WhatId;
                String subject = e.Subject;
                if (id != null) {
                    if (id.substring(0,3) == '500' && subject != 'Call log') {
                        caseIdsToUpdate.add(id);
                    }
                }
            }
        } else {
            for (Task e : Trigger.new) {
                String id = e.WhatId;
                String subject = e.Subject;
                if (id != null) {
                    if (id.substring(0,3) == '500' && subject != 'Call log') {
                        caseIdsToUpdate.add(id);
                    }
                }
                
                //Training Cirriculum 7-11-2014
                if (e.Activity_Type__c == 'Training Curriculum') {
                    tasksToInsert.add(e.Id);
                }
                           
            }
        }
        
        if (caseIdsToUpdate.size() > 0) { 
            CaseUpdateLogic.updateCases(caseIdsToUpdate);
        }
        
        if (!ProcessorControl.inFutureContext && tasksToInsert.size() > 0) {
            TrainingTaskLogic.insertTasks(tasksToInsert);
            ProcessorControl.inFutureContext = true;
        }
        
        
    }
}