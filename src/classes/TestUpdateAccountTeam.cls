@isTest
private class TestUpdateAccountTeam
{
    static testMethod void testAccountTeams()
    {
      createCustomSettings();

      Profile standardUserProfile = [select id from profile where name='Standard User']; 

      User childOwner = new User(FirstName='Bob', LastName='Marley', Username='BobMar@valspar.com', Email='BobMarley@heyman.us', Alias='BobMar', CommunityNickname='BobMarley', TimeZoneSidKey='America/Chicago', LocaleSidKey='en_US', EmailEncodingKey='UTF-8', ProfileId=standardUserProfile.Id, LanguageLocaleKey='en_US');
      insert childOwner ;

      Account parentAcct = new Account(Name='Test Parent Acct', Business_Unit__c = 'General Industrial');
      insert parentAcct;

      Account childAcct = new Account(Name='Test Child Acct', Business_Unit__c = 'General Industrial', ParentId = parentAcct.Id, OwnerId = childOwner.Id);
      insert childAcct;

      list<AccountTeamMember> parentAccountTeam = [SELECT UserId
                                                   FROM AccountTeamMember
                                                   WHERE AccountId = :parentAcct.id];

      system.AssertEquals(1, parentAccountTeam.size());
      system.AssertEquals(childOwner.Id, parentAccountTeam[0].UserId);
    }

    private static void createCustomSettings()
    {
      insert new Functionality_by_BU__c(Name='General Industrial', Parent_Account_Team_Creation__c = true);
    }
}