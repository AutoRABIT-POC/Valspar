trigger updateAccountTeam on Account (after insert, after update) {

/* Keep the account team on the parent account in sync with the account owners of all active child accounts */

  List<String> enabledBusinessUnits = new List<String>();
  
  for (Functionality_by_BU__c lookup : [SELECT Name
                                        FROM Functionality_by_BU__c
                                        WHERE Parent_Account_Team_Creation__c = true])
  {
    enabledBusinessUnits.add(lookup.Name);
  }

  list<id> accountIds = new list<id>();

  for(Account a : trigger.new) {
    System.Debug('updateAccountTeam, trigger processing account ' + a.Name);
    accountIds.add(a.Id);
  }

System.Debug('updateAccountTeam, ' + accountIds.size() + ' accounts to process');

  set<id> parentAccountIds = new set<id>();

  for (Account child: [SELECT ParentId, Name, Parent.Name, Business_Unit__c
                       FROM Account
                       WHERE Business_Unit__c in :enabledBusinessUnits
                         AND Id in :accountIds])
  {
    if (child.parentId != null)
    {
      System.Debug('updateAccountTeam, found parent account ' + child.Parent.Name);
      parentAccountIds.add(child.ParentId);
    }
  }

System.Debug('updateAccountTeam, ' + parentAccountIds.size() + ' parent accounts to process');

  map<id, set<id>> accountTeamMap = new map<id, set<id>>();
  list<AccountTeamMember> teamMemberList = new list<AccountTeamMember>();

  for (Account child : [SELECT ParentId, OwnerId, Owner.Name
                        FROM Account
                        WHERE ParentId in :parentAccountIds
                          AND Active__c = true
                          AND Owner.IsActive = true])
  {
    System.Debug('updateAccountTeam, child record, checking if ' + child.Owner.Name + ' is on the account team for ' + child.ParentId);

    set<id> teamMembers = accountTeamMap.get(child.ParentId);
    
    if (teamMembers == null)
    {
      teamMembers = new set<id>();
      accountTeamMap.put(child.ParentId, teamMembers);
    }

    if (!teamMembers.contains(child.OwnerId))
    {
      teamMembers.add(child.OwnerId);

      AccountTeamMember teamMember = new AccountTeamMember();
      teamMember.AccountId = child.parentId;
      teamMember.UserId = child.OwnerId;
      teamMember.TeamMemberRole = 'Sales Rep';      
      teamMemberList.add(teamMember);
    }
  }

System.Debug('updateAccountTeam, deleting all account team members for ' + parentAccountIds.size() + ' parent accounts');
  DELETE [SELECT id from AccountTeamMember WHERE AccountId in :parentAccountIds ];

System.Debug('updateAccountTeam, inserting ' + teamMemberList.size() + ' account team members');
  INSERT teamMemberList;
}