// *********************************************************************************************
// Filename:        Event.trigger
// Author:          Etherios Inc.
// Date Created:    11/18/2013
// Description:     The Before trigger sets the Start and End Time when the 1/2 day event checkboxes are checked
//                  The After trigger sends Case Ids to CaseUpdateLogic.updateCases for an update to the parent Case record  
//                  
//
// Date         Name                      Change      Comments
// --------------------------------------------------------------------------------------------
// 11/18/2013   aschultz@etherios.com                  File creation
// 02/10/2014   pstephens@etherios.com    CHG-520882   Modified to improve code coverage
// 08/01/2014   kadams@valspar.com        CHG-522256   Modified to add 1/4 day event option
// --------------------------------------------------------------------------------------------
// 
// Copyright 2013 Etherios Inc. All rights reserved. Customer confidential. Do not distribute.
// *********************************************************************************************
// *********************************************************************************************

trigger Event on Event (before Insert, before Update, after Insert, after Update, after Delete, after Undelete) {
    if (trigger.isBefore) {
        List<RecordType> RecordTypes = [SELECT Id FROM RecordType WHERE Name = 'ConsB&Q' AND sObjectType = 'Event' Limit 1];
        if (RecordTypes.size() > 0) {
            for (Event e : Trigger.new) {
                if (!e.IsAllDayEvent) {
                    if (e.RecordTypeId == RecordTypes[0].Id) {
                        if (e.X1_2_Day_Event_AM__c) {
                                                      
                           e.StartDateTime = Datetime.newInstance(e.StartDateTime.year(), e.StartDateTime.month(), e.StartDateTime.day(), 8, 0, 0);
                           e.ActivityDateTime = e.StartDateTime;
                           e.DurationInMinutes = 240;
                                              
                        } if (e.X1_2_Day_Event_PM__c) {
                                        
                           e.StartDateTime = Datetime.newInstance(e.StartDateTime.year(), e.StartDateTime.month(), e.StartDateTime.day(), 13, 0, 0);
                           e.ActivityDateTime = e.StartDateTime;
                           e.DurationInMinutes = 240;
                                              
                        } 
                        
                          if (e.X1_4_Day_Event__c) {
                                        
                           e.StartDateTime = Datetime.newInstance(e.StartDateTime.year(), e.StartDateTime.month(), e.StartDateTime.day(), 8, 0, 0);
                           e.ActivityDateTime = e.StartDateTime;
                           e.DurationInMinutes = 120;
                        }
                        
                          else if (e.X1_4_Day_Event_PM__c) {
                                        
                           e.StartDateTime = Datetime.newInstance(e.StartDateTime.year(), e.StartDateTime.month(), e.StartDateTime.day(), 13, 0, 0);
                           e.ActivityDateTime = e.StartDateTime;
                           e.DurationInMinutes = 120;
                        }
                    } 
                }
            }
        }
    } else if (trigger.isAfter) {  //After trigger sends caseIdsToUpdate to CaseUpdateLogic.updateCases.  '500' is the first 3 characters of any Case Id
        Set<Id> caseIdsToUpdate = new Set<Id>();
        if (Trigger.isDelete) {
            for (Event e : Trigger.old) {
                String id = e.WhatId;
                String subject = e.Subject;
                if (id != null) {
                    if (id.substring(0,3) == '500' && subject != 'Call log') {
                        caseIdsToUpdate.add(id);
                    }
                }
            }
        } else {
            for (Event e : Trigger.new) {
                String id = e.WhatId;
                String subject = e.Subject;
                if (id != null) {
                    if (id.substring(0,3) == '500' && subject != 'Call log') {
                        caseIdsToUpdate.add(id);
                    }
                }
            }
        }
        
        if (caseIdsToUpdate.size() > 0) { 
            CaseUpdateLogic.updateCases(caseIdsToUpdate);
        }
    }
}