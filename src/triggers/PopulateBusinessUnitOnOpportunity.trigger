trigger PopulateBusinessUnitOnOpportunity on Opportunity (before insert, before update) {
	
	/* Trigger populate the Business Unit on the Opportunity record with the 
	   Owner's business unit. */
	
	//Variables
	list<id> ownerList = new list<id>();
	map<id, string> ownerMap = new map<id, string>();
	list<Opportunity> oppsToUpdate = new list<Opportunity>();
	
	//Find out if a user change was committed:
	for(Opportunity o : trigger.new){
		if((trigger.isUpdate && o.OwnerId != trigger.oldMap.get(o.Id).OwnerId)||(trigger.isInsert && o.Business_Unit__c == null)){
			oppsToUpdate.add(o);
			ownerList.add(o.OwnerId);
		}
	}
	
	//Get the business unit for each owner and put in map:
	for (User u : [SELECT Id, Business_Unit__c FROM User WHERE Id IN :ownerList]){
		ownerMap.put(u.Id, u.Business_Unit__c);
	}
	
	//Populate the field on opportunity from the map:
	for (Opportunity o : oppsToUpdate){
		if (ownerMap.get(o.OwnerId) != null){
			o.Business_Unit__c = ownerMap.get(o.OwnerId);
		}
	}
}