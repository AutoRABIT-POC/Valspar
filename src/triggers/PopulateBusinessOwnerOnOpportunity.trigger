//Populates the Business_Owner__C field on the Opportunity object with the Opportunity owner's manager
//by K. Adams 11/12/13

trigger PopulateBusinessOwnerOnOpportunity on Opportunity (before insert, before update) {
  
  set<id> ownerSet = new set<id>(); //Opportunity owner ID's
  map<id, User> managerMap = new map<id, User>(); //map of manager to opportunity owner
  
 //For each opportunity in the trigger, add the owner ID to the owner ID set
  for (Opportunity o : trigger.new){
    ownerSet.add(o.OwnerId);
  }
 
  //For each opportunity owner, select the manager ID and add to the map
  for (User u : [SELECT Id, ManagerId FROM User WHERE Id IN :ownerSet]){
    managerMap.put(u.Id, u);
  }
 
  //For each opportunity in the trigger, set the Business Owner custom field equal to the opportunity owner's Manager
  for (Opportunity o : trigger.new){
    if(o.Business_Unit__C == 'Consumer Lowes')
    o.Business_Owner__C = managerMap.get(o.OwnerId).ManagerId;
  }
}