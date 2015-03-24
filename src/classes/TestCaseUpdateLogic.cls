// *********************************************************************************************
// Filename:        TestCaseUpdateLogic
// Author:          Etherios Inc.
// Date Created:    11/26/2013
// Description:     TestCaseUpdateLogic provides test coverage for CaseUpdateLogic and the 'After' component of the Event, Task, and Attachment triggers
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
private class TestCaseUpdateLogic {

    static testMethod void testNewEvent() {
        Case testCase = new Case();
        insert testCase;
        
        List<RecordType> RecordTypes = [SELECT Id FROM RecordType WHERE Name = 'ConsB&Q' AND sObjectType = 'Event' Limit 1];
        
        Datetime myDateTime = Datetime.now();
        Event testEvent = new Event();
        testEvent.Type = 'Sick';
        testEvent.StartDateTime = myDateTime.addDays(1);
        testEvent.DurationInMinutes = 30;     
        testEvent.WhatId = testCase.Id;  
        testEvent.RecordTypeId = RecordTypes[0].Id;
        testEvent.IsAllDayEvent = false;
        testEvent.X1_2_Day_Event_AM__c = true;
        
        Datetime myDateTime2 = Datetime.now();
        Event testEvent2 = new Event();
        testEvent2.Type = 'Sick';
        testEvent2.StartDateTime = myDateTime.addDays(1);
        testEvent2.DurationInMinutes = 30;  
        testEvent2.RecordTypeId = RecordTypes[0].Id;
        testEvent2.IsAllDayEvent = false;
        //testEvent2.X1_2_Day_Event_AM__c = false;
        testEvent2.X1_2_Day_Event_PM__c = true;
        
        Datetime myDateTime3 = Datetime.now();
        Event testEvent3 = new Event();
        testEvent3.Type = 'Sick';
        testEvent3.StartDateTime = myDateTime.addDays(1);
        testEvent3.DurationInMinutes = 30;  
        testEvent3.RecordTypeId = RecordTypes[0].Id;
        testEvent3.IsAllDayEvent = false;
        //testEvent2.X1_2_Day_Event_AM__c = false;
        testEvent3.X1_4_Day_Event__c = true;
        
        Datetime myDateTime4 = Datetime.now();
        Event testEvent4 = new Event();
        testEvent4.Type = 'Sick';
        testEvent4.StartDateTime = myDateTime.addDays(1);
        testEvent4.DurationInMinutes = 30;  
        testEvent4.RecordTypeId = RecordTypes[0].Id;
        testEvent4.IsAllDayEvent = false;
        //testEvent2.X1_2_Day_Event_AM__c = false;
        testEvent4.X1_4_Day_Event_PM__c = true;
        
        Test.startTest();
        
        insert testEvent;
        insert testEvent2;
        insert testEvent3;
        insert testEvent4;
        delete testEvent2;
        delete testEvent3;
        delete testEvent4;
          
        Test.stopTest(); 
        
        Case postTestCase = [SELECT Id, Custom_Last_Modified_Date_Time__c FROM Case LIMIT 1];
        System.assert(postTestCase.Custom_Last_Modified_Date_Time__c != null);
    }
    
    static testMethod void testDeleteEvent() {
        Case testCase = new Case();
        insert testCase;
        
        Datetime myDateTime = Datetime.now();
        Event testEvent = new Event();
        testEvent.Type = 'Sick';
        testEvent.StartDateTime = myDateTime.addDays(1);
        testEvent.DurationInMinutes = 30;     
        testEvent.WhatId = testCase.Id;   
        insert testEvent;
        Test.startTest();
        
        delete testEvent;
          
        Test.stopTest(); 
        
        Case postTestCase = [SELECT Id, Custom_Last_Modified_Date_Time__c FROM Case LIMIT 1];
        System.assert(postTestCase.Custom_Last_Modified_Date_Time__c != null);
    }
        
    static testMethod void testNewEvents() {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 210 ; i++) {
            Case testCase = new Case();
            cases.add(testCase);
        }
        insert cases;
        
        List<Event> testEvents = new List<Event>();
        for (Case c : cases) {
            Datetime myDateTime = Datetime.now();
            Event testEvent = new Event();
            testEvent.Type = 'Sick';
            testEvent.StartDateTime = myDateTime.addDays(1);
            testEvent.DurationInMinutes = 30;     
            testEvent.WhatId = c.Id; 
            testEvents.add(testEvent);  
        }
        
        Test.startTest();
        
        insert testEvents;
          
        Test.stopTest(); 
        
        List<Case> postTestCases = [SELECT Id, Custom_Last_Modified_Date_Time__c FROM Case];
        for (Case c : postTestCases) {
            System.assert(c.Custom_Last_Modified_Date_Time__c != null);
        }
    }    
 
    static testMethod void testNewTask() {
        Case testCase = new Case();
        insert testCase;
        
        Datetime myDateTime = Datetime.now();
        Task testTask = new Task();
        testTask.Type = 'Sick';
        testTask.WhatId = testCase.Id;   
        
        Test.startTest();
        
        insert testTask;
          
        Test.stopTest(); 
        
        Case postTestCase = [SELECT Id, Custom_Last_Modified_Date_Time__c FROM Case LIMIT 1];
        System.assert(postTestCase.Custom_Last_Modified_Date_Time__c != null);
    }    
    
    static testMethod void testDeleteTask() {
        Case testCase = new Case();
        insert testCase;
        
        Datetime myDateTime = Datetime.now();
        Task testTask = new Task();
        testTask.Type = 'Sick';
        testTask.WhatId = testCase.Id;   
        insert testTask;
        Test.startTest();
        
        delete testTask;
          
        Test.stopTest(); 
        
        Case postTestCase = [SELECT Id, Custom_Last_Modified_Date_Time__c FROM Case LIMIT 1];
        System.assert(postTestCase.Custom_Last_Modified_Date_Time__c != null);
    }      
    
    static testMethod void testNewAttachment() {
        Case testCase = new Case();
        insert testCase;
        
        Attachment attach=new Attachment();     
        attach.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach.body=bodyBlob;
        attach.parentId=testCase.id;
        
        Test.startTest();
        
        insert attach; 
          
        Test.stopTest(); 
        
        Case postTestCase = [SELECT Id, Custom_Last_Modified_Date_Time__c FROM Case LIMIT 1];
        System.assert(postTestCase.Custom_Last_Modified_Date_Time__c != null);
    }    
  
   static testMethod void testDeleteAttachment() {
        Case testCase = new Case();
        insert testCase;
        
        Attachment attach=new Attachment();     
        attach.Name='Unit Test Attachment';
        Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
        attach.body=bodyBlob;
        attach.parentId=testCase.id;
        insert attach;
        Test.startTest();
        
        delete attach;
          
        Test.stopTest(); 
        
        Case postTestCase = [SELECT Id, Custom_Last_Modified_Date_Time__c FROM Case LIMIT 1];
        System.assert(postTestCase.Custom_Last_Modified_Date_Time__c != null);
    }      
}