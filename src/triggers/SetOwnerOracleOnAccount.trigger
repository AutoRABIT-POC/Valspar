trigger SetOwnerOracleOnAccount on Account (before insert, before update) {

    /* When an Account with the record type of "Oracle Mastered" is created or modified execute trigger.   
     When User Record Employee Number = Account Owner Employee Number 
      on the Account record make the User the owner of the Account.  */
  
  string recordType = '';
  string correctOwnerID = '';
  Map<string, string> mUsers = new Map<string, string>();
  Set<string> mEmployeeNumbers = new Set<string>();
    
  list<RecordType> aList = [select id 
                            from RecordType 
                            where Name = 'Integrated Account' and SobjectType = 'Account'];
  if (!aList.isEmpty()){
     recordType = aList[0].id;
  }
  
  //Get a list of the User Records that should be owners of these accounts.
  for(Account a : trigger.new){
    if (a.employee_number__c <> null){
        mEmployeeNumbers.add(a.employee_number__c);
    }     
  }
  
  //Select the users that should be the owners of these accounts
  list<User> myUsers = new list<User>();
  myUsers = [Select ID, EmployeeNumber 
                From User
                Where EmployeeNumber in :mEmployeeNumbers];
  
  //Put these users into a Map so we can get the user id based on the employee number
  for(User u1 : myUsers){
    mUsers.put(u1.EmployeeNumber, u1.id);
  }
  
  for(Account a : trigger.new){
    if (a.RecordTypeId == recordType){
        
        //We have an Oracle Mastered Account
        if ( mUsers.containsKey(a.employee_number__c)){
            //Get the correct owner of this Account by matching the employee number
            
            correctOwnerID = mUsers.get(a.employee_number__c);
            if (correctOwnerID <> null) {
                if (correctOwnerID.length() > 0 && correctOwnerID <> a.OwnerID){
                    a.OwnerID = correctOwnerID;
                }
            }
        }       
    }
  }
  
}