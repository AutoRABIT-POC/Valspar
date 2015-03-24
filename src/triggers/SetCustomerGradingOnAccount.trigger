trigger SetCustomerGradingOnAccount on Account (after insert, after update) {

    List<Id> acctIds = new List<Id>();

	for (Account newAcct : Trigger.new)
	{
		if (Trigger.oldMap == null)
		{
			acctIds.add(newAcct.Id);
		}
		else
		{
		    Account oldAcct = Trigger.oldMap.get(newAcct.Id);
		    if (oldAcct == null ||
		    	oldAcct.Rolling_12_Month_Sales__c != newAcct.Rolling_12_Month_Sales__c ||
		    	oldAcct.Rolling_12_Month_Sales_Margin__c != newAcct.Rolling_12_Month_Sales_Margin__c) {
		        acctIds.add(newAcct.Id);
		    }
		}
	}

    Account[] accounts = [SELECT Id
                          FROM Account
                          WHERE Id IN :acctIds];

    new AccountGrading().calculateGradesAndRanks(accounts);
}