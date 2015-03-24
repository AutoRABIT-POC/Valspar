// *********************************************************************************************
// Filename:        TrainingTaskLogicTest
// Author:          Etherios Inc.
// Date Created:    7/22/2014
// Description:     TrainingTaskLogicTest handles all test cases for the TrainingTaskLogic class
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
@isTest
public class TrainingTaskLogicTest {
    static testMethod void testTaskTrigger(){
        Account account1 = new Account(name='test account');
        insert account1;
        
        Contact[] contactsToCreate = new Contact[]{};
        
        Contact contact1 = new Contact(AccountId=account1.Id,lastname='testing1',firstname='apex');
        insert contact1;
        
        Curriculum__c curriculum = new Curriculum__c(Name='Testing');
        insert curriculum;
        
        Training__c[] trainingToCreate = new Training__c[]{};
        for (Integer x=0; x<5;x++) {
            Training__c training = new Training__c(Name='Training Test '+x,Category__c='Test',Assortment__c='Test');
            trainingToCreate.add(training);
        }
        insert trainingToCreate;
        
        Training_Curriculum__c[] trainingCurriculumToCreate = new Training_Curriculum__c[]{};
        for (Training__c training : trainingToCreate) {
            Training_Curriculum__c trainingCurriculum = new Training_Curriculum__c(Training__c=training.Id, Curriculum__c=curriculum.Id);
            trainingCurriculumToCreate.add(trainingCurriculum);
        }
        insert trainingCurriculumToCreate;

        Task[] tasksToCreate = new Task[]{};
        for (Integer x=0; x<200; x++) {
            Task t = new Task(RecordTypeId='012E00000002D8Y',Subject='Testing',WhatId=curriculum.Id,WhoId=contact1.Id,Activity_Type__c='Training Curriculum',Training_Type__c='Aisle');
            tasksToCreate.add(t);
        }
        System.debug(tasksToCreate.size());
                
        //Now insert data causing an contact trigger to fire. 
        Test.startTest();
        insert tasksToCreate;
        Test.stopTest();
    }   
}