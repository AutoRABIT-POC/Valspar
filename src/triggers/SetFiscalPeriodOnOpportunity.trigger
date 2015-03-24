trigger SetFiscalPeriodOnOpportunity on Opportunity (before insert, before update) {

    /* This trigger will populate the Fiscal Period on an opportunity based on the global region */

    //Variables
    date earliestDate;
    date latestDate;
    list<Fiscal_Period__c> fpList = new list<Fiscal_Period__c>();

    //Calculate the earliest and latest dates needed for the fiscal period query
    for (Opportunity o : trigger.new)
    {
        if (earliestDate == null || earliestDate > o.CloseDate)
        {
            earliestDate = o.CloseDate;
        }
        if (latestDate == null || latestDate < o.CloseDate)
        {
            latestDate = o.CloseDate;
        }
    }

    //Create a list of fiscal periods that fall within earliest to latest date range
    for (Fiscal_Period__c fp : [SELECT Id, Name,
                                       Start_Date__c, End_Date__c,
                                       ROW_Start_Date__c, ROW_End_Date__c
                                FROM Fiscal_Period__c
                                WHERE ((Start_Date__c <= :earliestDate AND End_Date__c >= :latestDate) OR
                                       (ROW_Start_Date__c <= :earliestDate AND ROW_End_Date__c >= :latestDate)) OR
                                      ((Start_Date__c <= :system.today() AND End_Date__c >= :system.today()) OR
                                       (ROW_Start_Date__c <= :system.today() AND ROW_End_Date__c >= :system.today())) 
                                ORDER BY Start_Date__c ASC])
    {
        fpList.add(fp);
    }
    
    //Apply the fiscal period to the opportunities
    for (Opportunity o : trigger.new)
    {
        date matchDate = o.CloseDate;

        if (trigger.isUpdate)
        {
            if (o.StageName.contains('Closed') && !trigger.oldMap.get(o.Id).StageName.contains('Closed'))
            {
                matchDate = system.today();
            }       
        }
        
        for (Fiscal_Period__c fp : fpList)
        {
            if (o.Global_Region__c == 'North America')
            {
                if (fp.Start_Date__c <= matchDate && fp.End_Date__c >= matchDate)
                {
                    System.debug('Updating Fiscal Period: ' + o.Fiscal_Period__c + '<--' + fp.Id);
                    o.Fiscal_Period__c = fp.Id;
                    break;
                }
            }
            else
            {
                if (fp.ROW_Start_Date__c <= matchDate && fp.ROW_End_Date__c >= matchDate)
                {
                    o.Fiscal_Period__c = fp.Id;
                    break;
                }
            }
        }
    }
}