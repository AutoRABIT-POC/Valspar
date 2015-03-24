// *********************************************************************************************
// Filename:        CaseUpdateLogic
// Author:          Etherios Inc.
// Date Created:    11/25/2013
// Description:     CaseUpdateLogic updates the Custom_Last_Modified_Date_Time__c field on Case 
//                  
//
// Date     | Name                          | Task#     | Comments
// --------------------------------------------------------------------------------------------
// 11/25/2013   |aschultz@etherios.com          |           |File creation
// --------------------------------------------------------------------------------------------
// 
// Copyright 2013 Etherios Inc. All rights reserved. Customer confidential. Do not distribute.
// *********************************************************************************************
// *********************************************************************************************
public class CaseUpdateLogic {
     
    public static void updateCases (Set<Id> caseIdsToUpdate){
        system.debug('### UserInfo.getName() = ' + UserInfo.getName());
        if (UserInfo.getName() != 'API USER') {
        
            List<Case> casesToUpdate = new List<Case>();
            for (Id i : caseIdsToUpdate) {
                Case c = new Case(Id = i, Custom_Last_Modified_Date_Time__c = Datetime.now());
                casesToUpdate.add(c); 
            }   
            
            update casesToUpdate;
        }
    }
    
    public static void updateCases (List<CaseArticle> caseArticles){
        if (UserInfo.getName() != 'API USER') {
            if (caseArticles.size() > 0) {
                Set<Id> caseIdsToUpdate = new Set<Id>(); 
                for (CaseArticle ca : caseArticles) {
                    caseIdsToUpdate.add(ca.CaseId);
                }   
                
                List<Case> casesToUpdate = new List<Case>();
                for (Id i : caseIdsToUpdate) {
                    Case c = new Case(Id = i, Custom_Last_Modified_Date_Time__c = Datetime.now());
                    casesToUpdate.add(c); 
                }   
                update casesToUpdate;               
            }
        }
    }   
}