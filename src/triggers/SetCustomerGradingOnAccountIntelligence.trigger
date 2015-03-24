trigger SetCustomerGradingOnAccountIntelligence on Account_Intelligence__c (after insert, after update) {

    Set<Id> acctIntelligenceIds = trigger.newMap.keySet();

    Account[] accounts = [SELECT Id
                          FROM Account
                          WHERE Id IN (SELECT Account__c
                                       FROM Account_Intelligence__c
                                       WHERE Id IN :acctIntelligenceIds)];

    new AccountGrading().calculateGradesAndRanks(accounts);
}