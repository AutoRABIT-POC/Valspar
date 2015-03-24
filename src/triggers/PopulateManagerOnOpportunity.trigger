trigger PopulateManagerOnOpportunity on Opportunity (before insert, before update) {
	
	set<id> ownerSet = new set<id>();
	map<id, User> managerMap = new map<id, User>();
	
	for (Opportunity o : trigger.new){
		ownerSet.add(o.OwnerId);
	}
	
	for (User u : [SELECT Id, ManagerId, DelegatedApproverId FROM User WHERE Id IN :ownerSet]){
		managerMap.put(u.Id, u);
	}
	
	for (Opportunity o : trigger.new){
		o.Manager__c = managerMap.get(o.OwnerId).ManagerId;
		o.Delegated_Approver__c = managerMap.get(o.OwnerId).DelegatedApproverId;
	}
}