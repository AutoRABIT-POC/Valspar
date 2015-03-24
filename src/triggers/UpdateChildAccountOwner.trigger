trigger UpdateChildAccountOwner on Account (after update) {
	updatAccountOwnerBLogic.updateAccountOwner(trigger.newMap, trigger.oldMap);
     /*
      Set<Id> ParentAccountIds = new Set<Id>(); //set for holding the Ids of all Accounts that have been assigned to new Owners
      Map<Id, String> oldOwnerIds = new Map<Id, String>(); //map for holding the old account ownerId
      Map<Id, String> newOwnerIds = new Map<Id, String>(); //map for holding the new account ownerId
      List<Account> childUpdates = new List<Account>(); //Account sObject to hold OwnerId updates
      List<Contact> contactUpdates = new List<Contact>(); //Contact sObject to hold OwnerId updates
      //Task[] taskUpdates = new Task[0]; //Task sObject to hold OwnerId updates
      //Event[] eventUpdates = new Event[0];
      
     for (Account a : Trigger.new) { //for all records
         if (a.OwnerId != Trigger.oldMap.get(a.Id).OwnerId) {
            oldOwnerIds.put(a.Id, Trigger.oldMap.get(a.Id).OwnerId); //put the old OwnerId value in a map
            newOwnerIds.put(a.Id, a.OwnerId); //put the new OwnerId value in a map
            ParentAccountIds.add(a.Id); //add the Account Id to the set
         }
      }
           
     if (!ParentAccountIds.isEmpty()) { //if the accountIds Set is not empty
         for (Account act : [SELECT Id, OwnerID FROM Account WHERE Id in :ParentAccountIds and Business_Unit__C = 'Consumer Lowes' and Account_Type__C = 'Lowes Store']) { //get updated parent Accounts
            String newOwnerId = newOwnerIds.get(act.Id); //get the new OwnerId value for the parent account
            String oldOwnerId = oldOwnerIds.get(act.Id); //get the old OwnerId value for the parent account
             
            for (Account ca : [SELECT Id, OwnerID,
                              (SELECT Id, OwnerId, AccountID FROM Contacts)
                              , (SELECT Id, OwnerId, AccountId FROM Tasks WHERE Status != 'Completed')
                                  FROM Account WHERE ParentId in :ParentAccountIds 
                                  and Business_Unit__C = 'Consumer Lowes' and Account_Type__C='Pro Account']) { //get all child Accounts, child Contacts and child Tasks
                                  
               if (ca.OwnerId == oldOwnerId ) { //if the child account is assigned to the old account Owner
                  Account updatedAccount = new Account(Id = ca.Id, OwnerId = newOwnerId); //create a new Account sObject
                  childUpdates.add(updatedAccount); //add the child account to List of updates
               }
                  
            for (Contact c : ca.Contacts) { //for all contacts
               if (c.OwnerId == oldOwnerId) { //if the contact is assigned to the old account Owner
                  Contact updatedContact = new Contact(Id = c.Id, OwnerId = newOwnerId); //create a new Contact sObject
                  contactUpdates.add(updatedContact); //add the contact to List of updates
               }
            }
            
            //for (Task t : ca.Tasks) { //for all uncompleted tasks
            //   if (t.OwnerId == oldOwnerId) { //if the task is assigned to the old account Owner
            //      Task updatedTask = new Task(Id = t.Id, OwnerId = newOwnerId); //create a new Task sObject
            //      taskUpdates.add(updatedTask); //add the task to List of updates
            //   }
            //}          
            }
        }
     
    // update taskUpdates; //Update Child Tasks
    }
    update childUpdates; //update Child Accounts
    update contactUpdates; //Update Child contacts*/
}