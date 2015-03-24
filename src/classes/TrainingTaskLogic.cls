// *********************************************************************************************
// Filename:        TrainingTaskLogic
// Author:          Etherios Inc.
// Date Created:    7/11/2014
// Description:     TrainingTaskLogic handles all logic around creating, modifying or deleting tasks for the training curriculum.
//                  
//
// Date     | Name                          | Task#     | Comments
// --------------------------------------------------------------------------------------------
// 7/11/2014   |jwhittington@etherios.com          |           |File creation
// --------------------------------------------------------------------------------------------
// 
// Copyright 2014 Etherios Inc. All rights reserved. Customer confidential. Do not distribute.
// *********************************************************************************************
// *********************************************************************************************
public class TrainingTaskLogic {
    @future
    public static void insertTasks(Set<Id> taskIdSet){
        // Intialize variables to be used later
        List<Task> tasksToInsert = new List<Task>();
        Set<Id> curriculumSet = new Set<Id>();
        Map<ID,Set<Id>> trainingMap = new Map<ID,Set<ID>>();
        Map<ID,Set<Id>> contactMap = new Map<ID,Set<ID>>();
        Map<ID,Decimal> durationMap = new Map<ID,Decimal>();
        
        // Get the original task list from the trigger
        List<Task> taskList = [Select Id, WhatId, WhoId, Subject, ActivityDate, Status, Priority, OwnerId, CurrencyisoCode
            , IsReminderSet, IsRecurrence, Event_Status__c, Training_Type__c, X1_2_Day_Event_AM__c
            , X1_2_Day_Event_PM__c, Training_Instance__c, Duration_In_Minutes__c From Task Where Id =: taskIdSet];
        
        System.debug('---- taskList.size(): ' + taskList.size());
        
        // Get the contact ids for each task
        List<TaskRelation> relationList = [SELECT TaskId, RelationId From TaskRelation WHERE TaskId =: taskIdSet AND IsWhat = false];
        System.debug('---- relationList.size(): ' + relationList.size());
        
        for (TaskRelation tr : relationList) {
            TrainingTaskLogic.AddIdToMap(contactMap, tr.TaskId, tr.RelationId);
        }

        // Build a set of training cirriculum ids so we can look up the training courses from Training_Curriculum__c
        for (Task t : taskList) {
            curriculumSet.add(t.WhatId);
        }
        
        // Get the training course ids and duration for each cirriculum
        List<Training_Curriculum__c> trainingList = [SELECT Curriculum__c,Training__c,Minutes__c FROM Training_Curriculum__c WHERE Curriculum__c =: curriculumSet];
        System.debug('---- trainingList.size(): ' + trainingList.size());
        
        for (Training_Curriculum__c tc : trainingList) {
            TrainingTaskLogic.AddIdToMap(trainingMap, tc.Curriculum__c, tc.Training__c);
            durationMap.put(tc.Training__c,tc.Minutes__c);
        }
        
        System.debug('---- trainingMap.size(): ' + trainingMap.size());
        
        // Build a list of tasks to insert
        for (Task t : taskList) {
            Set<Id> trainingSet = trainingMap.get(t.WhatId);
            Set<Id> contactSet = contactMap.get(t.Id);
            
            for (Id tid : trainingSet) {
                Decimal duration = durationMap.get(tid);
                for (Id cid : contactSet) {
                    Task newTask = new Task();
                    newTask.WhatId = tid;
                    newTask.WhoId = cid;
                    System.debug('---- t.WhoId: ' + t.WhoId);
                    System.debug('---- newTask.WhoId: ' + newTask.WhoId);
                    newTask.Activity_Type__c = 'Training Course';
                    newTask.Subject = t.Subject;
                    newTask.ActivityDate = t.ActivityDate;
                    newTask.Status = t.Status;
                    newTask.Priority = t.Priority;
                    newTask.OwnerId = t.OwnerId;
                    newTask.CurrencyIsoCode = t.CurrencyIsoCode;
                    newTask.IsReminderSet = t.IsReminderSet;
                    newTask.IsRecurrence = t.IsRecurrence;
                    newTask.Event_Status__c = t.Event_Status__c;
                    newTask.Training_Type__c = t.Training_Type__c;
                    newTask.X1_2_Day_Event_AM__c = t.X1_2_Day_Event_AM__c;
                    newTask.X1_2_Day_Event_PM__c = t.X1_2_Day_Event_PM__c;
                    newTask.Training_Instance__c = t.Training_Instance__c;
                    newTask.Duration_In_Minutes__c = duration;
                    newTask.Session_Id__c = t.id;
                    tasksToInsert.add(newTask);
                }
            }
        }
        
        System.debug('---- tasksToInsert.size(): ' + tasksToInsert.size());
        if (tasksToInsert.size() > 0) {
            insert tasksToInsert;
        }
    }
   
    // Adds the value to the set if it exists, otherwise create the set and add the value
    public static void AddIdToMap(Map<Id,Set<Id>> m, Id id, String value) {
        if (m.containsKey(id)) {
            m.get(id).add(value);
        } else {
            Set<Id> valueSet = new Set<Id>();
            valueSet.add(value);
            m.put(id,valueSet);
        }
    }
}