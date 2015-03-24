trigger PopulateBusinessUnitOnLead on Lead (before insert, before update) {
	
	/* Trigger populate the Business Unit on the Lead record with the 
	   Owner's business unit. */
	
	//Variables
	list<id> ownerList = new list<id>();
	map<id, string> ownerMap = new map<id, string>();
	list<Lead> leadsToUpdate = new list<Lead>();
	
	//Find out if a user change was committed:
	for(Lead l : trigger.new){
		if((trigger.isUpdate && l.OwnerId != trigger.oldMap.get(l.Id).OwnerId)||(trigger.isInsert && l.Business_Unit__c == null)){
			leadsToUpdate.add(l);
			ownerList.add(l.OwnerId);
		}
	}

	//Get the business unit for each owner and put in map:
	for (User u : [SELECT Id, Business_Unit__c FROM User WHERE Id IN :ownerList]){
		ownerMap.put(u.Id, u.Business_Unit__c);
	}
	
	//Populate the field on lead from the map:
	for (Lead l : leadsToUpdate){
		if (ownerMap.get(l.OwnerId) != null){
			l.Business_Unit__c = ownerMap.get(l.OwnerId);
		}
	}
}