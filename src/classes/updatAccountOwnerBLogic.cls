public without sharing class updatAccountOwnerBLogic {
    public static void updateAccountOwner(Map<Id, Account> recsNewMap, Map<Id, Account> recsOldMap){
        System.debug(Logginglevel.INFO, '****** updateAccountOwnerBLogic.updateAccountOwner START ******');
        // map the account to the owner
        Map<Id, Id> updatedAccounts = new Map<Id, Id>();
        
        List<Task> tasksToUpdate = new List<Task>();
        List<Account> acctsToUpdate = new List<Account>();
        List<Contact> contactsToUpdate = new List<Contact>();
        List<Event> eventsToUpdate = new List<Event>();
        
        
        for(Account a : recsNewMap.values()){
            // for each account in the new map, check to see if it's owner has changed
            if(a.OwnerId!=recsOldMap.get(a.Id).OwnerId){
                //add this account to the set
                if(!updatedAccounts.keySet().contains(a.Id)){
                    updatedAccounts.put(a.Id, a.OwnerId);
                }
            }
        }
        if(!updatedAccounts.isEmpty()){
            List<Account> relatedRecords = [select OwnerId, ParentId,
                                                (Select OwnerId, AccountId FROM Contacts),
                                                (Select OwnerId, AccountID FROM Tasks WHERE Status!='Completed'),
                                                (Select OwnerId, AccountID FROM Events WHERE Event_Status__C !='Completed') 
                                            from Account 
                                            where ParentId IN: updatedAccounts.keySet() ];
            if(relatedRecords.size() > 0){
                for(Account a: relatedRecords){
                    // get the parents new Id
                    a.OwnerId = updatedAccounts.get(a.ParentID);
                    acctsToUpdate.add(a);
                    // loop through the associated contacts
                    for(Contact c : a.Contacts){
                        c.OwnerId = a.OwnerId;
                        contactsToUpdate.add(c);
                    }
                    // loop through the associated tasks
                    for(Task t: a.Tasks){
                        t.OwnerId = a.OwnerId;
                        tasksToUpdate.add(t); 
                    }
                    
                    // loop through the associated tasks
                    for(Event e: a.Events){
                        e.OwnerId = a.OwnerId;
                        eventsToUpdate.add(e); 
                    }
                    
                }
                update acctsToUpdate;
                update contactsToUpdate;
                update tasksToUpdate;
                update eventsToUpdate;
            }
        }
        System.debug(Logginglevel.INFO, '****** updatAccountOwnerBLogic END *******');
    }
}