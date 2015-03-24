// *********************************************************************************************
// Filename:        Attachment.trigger
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
trigger Attachment on Attachment (after delete, after insert, after undelete, after update) {
	//After trigger sends caseIdsToUpdate to CaseUpdateLogic.updateCases.  '500' is the first 3 characters of any Case Id
	if (trigger.isAfter) {
    	Set<Id> caseIdsToUpdate = new Set<Id>();
    	if (Trigger.isDelete) {
	    	for (Attachment e : Trigger.old) {
	    		String id = e.ParentId;
	    		if (id != null) {
		    		if (id.substring(0,3) == '500') {
		    			caseIdsToUpdate.add(id);
		    		}
	    		}
	    	}
    	} else {
	    	for (Attachment e : Trigger.new) {
	    		String id = e.ParentId;
	    		if (id != null) {
		    		if (id.substring(0,3) == '500') {
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