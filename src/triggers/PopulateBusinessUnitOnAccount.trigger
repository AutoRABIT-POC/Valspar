trigger PopulateBusinessUnitOnAccount on Account (before insert, before update) {
	
	/* Trigger populate the Business Unit on the Account record with the 
	   Owner's business unit. */
	
	//Variables
	list<id> ownerList = new list<id>();
	map<id, string> ownerMap = new map<id, string>();
	list<Account> acctsToUpdate = new list<Account>();
	
	//Find out if a user change was committed:
	for(Account a : trigger.new){
		if((trigger.isUpdate && a.OwnerId != trigger.oldMap.get(a.Id).OwnerId)||(trigger.isInsert && a.Business_Unit__c == null)){
			acctsToUpdate.add(a);
			ownerList.add(a.OwnerId);
		}
	}
	
	//Get the business unit for each owner and put in map:
	for (User u : [SELECT Id, Business_Unit__c FROM User WHERE Id IN :ownerList]){
		ownerMap.put(u.Id, u.Business_Unit__c);
	}

	for(Account a : acctsToUpdate){
		if(ownerMap.get(a.OwnerId) != null){
			a.Business_Unit__c = ownerMap.get(a.OwnerId);
		}
	}
}