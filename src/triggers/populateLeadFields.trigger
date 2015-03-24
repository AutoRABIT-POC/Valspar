//Maps lead fields to the Account object. Created due to Salesforce restriction of only being able to map a field to one destination
//by K. Adams 2/12/14


trigger populateLeadFields on Lead (before update) {

    Map<Id,Id> leadParent = new Map<Id,Id>(); // Map of the converted Contact ID and the Parent Account (Store__C)
    Map<Id,Decimal> leadRevenue = new Map<Id,Decimal>(); // Map of the converted Contact ID and the Estimated Annual Revenue
    Map<Id,String> leadMarketSeg = new Map<Id,String>(); // Map of the converted Contact ID and the Market Segment
    Map<Id,String> leadGlobalReg = new Map<Id,String>(); // Map of the converted Contact ID and the Global Region
    Map<Id,String> leadGeoReg = new Map<Id,String>(); // Map of the converted Contact ID and the Geo Region

    //For each lead in the trigger, check to see if Lead is converted and if so, then add to the maps
    for(Lead lead : Trigger.new) {
        if (lead.IsConverted) {
            leadParent.put(lead.ConvertedAccountId,lead.Store__C);
            leadRevenue.put(lead.ConvertedAccountId,lead.Est_Annual_Revenue__C);
            leadMarketSeg.put(lead.ConvertedAccountId,lead.Market_Segment__C);
            leadGlobalReg.put(lead.ConvertedAccountId,lead.Global_Region__C);
            leadGeoReg.put(lead.ConvertedAccountId,lead.Geo_Region__C);
        }
    }
    
    //List of converted accounts that need to be updated with the value
    List<Account> conAccounts = [select Id from Account WHERE Account.Id IN :leadParent.keySet()];
    
    //For each account in the list, set the ParentID equal to the Store__C value of the corresponding converted Lead
    for ( Account a : conAccounts) {
        a.ParentId = leadParent.get(a.Id);
        a.AnnualRevenue = leadRevenue.get(a.Id);
        a.Market_Segment__C = leadMarketSeg.get(a.Id);
        a.Global_Region__C = leadGlobalReg.get(a.Id);
        a.Geo_Region__C = leadGeoReg.get(a.Id);
    }
    
    //Update the account records
    update conAccounts;
}