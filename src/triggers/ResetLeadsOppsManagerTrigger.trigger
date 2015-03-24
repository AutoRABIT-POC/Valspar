trigger ResetLeadsOppsManagerTrigger on User (after update) {
	User newUser = trigger.new[0];
	User oldUser = trigger.old[0];

	System.debug(Logginglevel.INFO, 'New call');
	System.debug(Logginglevel.INFO, 'Working on user ' + newUser.Username + ' againt old user ' + oldUser.Username);
	
	if (newUser.ManagerId != oldUser.ManagerId) {
		System.debug(Logginglevel.INFO, 'Managers don\'t match ' + newUser.ManagerId + ' <> ' + oldUser.ManagerId); 
	}
	else if (newUser.ManagerId == null) {
		System.debug(Logginglevel.INFO, 'New Manager is null ' + newUser.ManagerId + ' = ' + oldUser.ManagerId);	
	}
	else {
		System.debug(Logginglevel.INFO, 'Managers match ' + newUser.ManagerId + ' = ' + oldUser.ManagerId); 		
	}

	//if (newUser.ManagerId != null && newUser.ManagerId != oldUser.ManagerId)
	
	if (newUser.ManagerId != null && newUser.ManagerId != oldUser.ManagerId) {
		List<Lead> leads = [SELECT Id, Manager__c, OwnerId FROM Lead WHERE OwnerId = :newUser.Id and isConverted = false];
		for (Lead l : leads){
			System.debug(Logginglevel.INFO, 'Updating Lead with ' + newUser.ManagerId);
    		l.Manager__c = newUser.ManagerId;
  		}  	
		System.debug(Logginglevel.INFO, 'Upsert Leads');
		upsert leads;
		
		List<Opportunity> opportunities = [SELECT OwnerId, Manager__c, Id FROM Opportunity WHERE OwnerId = :newUser.Id];
		for (Opportunity o : opportunities){
			System.debug(Logginglevel.INFO, 'Updating Opportunity with ' + newUser.ManagerId);
	    	o.Manager__c = newUser.ManagerId;
	  	}  	
		System.debug(Logginglevel.INFO, 'Usert Opportunities');
		upsert opportunities;
	}

	System.debug(Logginglevel.INFO, 'Done processing ' + newUser.Email);
	
}