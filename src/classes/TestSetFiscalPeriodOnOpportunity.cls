@isTest
private class TestSetFiscalPeriodOnOpportunity {

    static testMethod void setFiscalPeriodOnOpportunityNA() {
        //Create
        list<Fiscal_Period__c> fpToDelete = new list<Fiscal_Period__c>();
        list<Fiscal_Period__c> fpList = new list<Fiscal_Period__c>();
		
        
        //gwinkel add fp 02/04/2014
        Fiscal_Period__c fp = new Fiscal_Period__c();
        fp.Name = 'test';
        fp.CurrencyIsoCode = 'USD';
        fp.Start_Date__c = system.today().addDays(-30);
        fp.End_Date__c = system.today().addDays(30);
        fp.ROW_Start_Date__c = system.today().addDays(-30);
        fp.ROW_End_Date__c = system.today().addDays(30);
		fpList.add(fp);
        /*
        Fiscal_Period__c fp2 = new Fiscal_Period__c();
        fp2.Name = 'test';
        fp2.CurrencyIsoCode = 'USD';
        fp2.Start_Date__c = system.today().addDays(-30);
        fp2.End_Date__c = system.today().addDays(30);
        fp2.ROW_Start_Date__c = system.today().addDays(-30);
        fp2.ROW_End_Date__c = system.today().addDays(30);
        fpList.add(fp2);
        */
        insert fpList;
        /*
        for (Fiscal_Period__c fp : [SELECT Id
                                    FROM Fiscal_Period__c
                                    WHERE Start_Date__c >= :system.today().addYears(-1)
                                      AND End_Date__c <= :system.today().addYears(1)])
        {
            fpToDelete.add(fp);
        }
        delete fpToDelete;
		*/
        /*
        String fyName = String.valueOf(system.Today().year());

        Fiscal_Year__c testYear = new Fiscal_Year__c(Name='TestYear', 
                                                   Start_Date__c=system.Today(),
                                                   End_Date__c=system.Today().addDays(30),
                                                   Fiscal_Year__c=fy.Id);
        
        Fiscal_Year__c fy = [SELECT Id
                             FROM Fiscal_Year__c
                             WHERE Name = :fyName 
                             LIMIT 1];
*/		
/*
        Fiscal_Period__c fp = new Fiscal_Period__c(Name='TestPeriod 1 - ' + system.Today().year(), 
                                                   Start_Date__c=system.Today(),
                                                   End_Date__c=system.Today().addDays(30),
                                                   Fiscal_Year__c=fy.Id);
        fpList.add(fp);
        Fiscal_Period__c fp2 = new Fiscal_Period__c(Name='TestPeriod 2 - ' + system.Today().year(), 
                                                    Start_Date__c=system.Today().addDays(31),
                                                    End_Date__c=system.Today().addDays(60),
                                                    Fiscal_Year__c=fy.Id);
        fpList.add(fp2);
        */
        
        //insert fpList;

        Account a = new Account(Name='Test');
        insert a;

        Opportunity o = new Opportunity(Name='Test',
                                        AccountId=a.Id,
                                        CloseDate=Date.Today().addDays(15), 
                                        StageName='Qualification',
                                        Annual_Expected_Revenue__c=1,
                                        Global_Region__c = 'North America');
        //Invoke
        insert o;
		System.debug('Opp Insert:' + o.Fiscal_Period__c);
        //o.StageName = 'Closed';
        //update o;
        
        //Check
        Opportunity testOpp = [SELECT Id,
                               Fiscal_Period__c
                               FROM Opportunity
                               WHERE Name = 'Test'
                               LIMIT 1][0];
        
        //Invoke Close Functionality
        o.StageName = 'Closed/Won';
        o.Reason_Won_Lost__c = 'No Decision';
        update o;
		System.debug('Opp Update:' + o.Fiscal_Period__c);
        //Check
        Opportunity testOpp2 = [SELECT Id, Fiscal_Period__c
                                FROM Opportunity
                                WHERE Name = 'Test'
                                LIMIT 1][0];

        system.assertEquals(fp.Id, testOpp2.Fiscal_Period__c);
    }

    static testMethod void setFiscalPeriodOnOpportunityROW() {
        //Create
        list<Fiscal_Period__c> fpToDelete = new list<Fiscal_Period__c>();
        list<Fiscal_Period__c> fpList = new list<Fiscal_Period__c>();

        //gwinkel add fp 02/04/2014
        Fiscal_Period__c fp = new Fiscal_Period__c();
        fp.Name = 'test';
        fp.CurrencyIsoCode = 'USD';
        fp.Start_Date__c = system.today().addDays(-30);
        fp.End_Date__c = system.today().addDays(30);
        fp.ROW_Start_Date__c = system.today().addDays(-30);
        fp.ROW_End_Date__c = system.today().addDays(30);
		fpList.add(fp);
        /*
        Fiscal_Period__c fp2 = new Fiscal_Period__c();
        fp2.Name = 'test';
        fp2.CurrencyIsoCode = 'USD';
        fp2.Start_Date__c = system.today().addDays(-30);
        fp2.End_Date__c = system.today().addDays(30);
        fp2.ROW_Start_Date__c = system.today().addDays(-30);
        fp2.ROW_End_Date__c = system.today().addDays(30);
        fpList.add(fp2);
        */
        insert fpList;
        
        /*
        for (Fiscal_Period__c fp : [SELECT Id
                                    FROM Fiscal_Period__c
                                    WHERE ROW_Start_Date__c >= :system.today().addYears(-1)
                                      AND ROW_End_Date__c <= :system.Today().addYears(1)])
        {
            fpToDelete.add(fp);
        }
        delete fpToDelete;

        String fyName = String.valueOf(system.Today().year());

        Fiscal_Year__c fy = [SELECT Id
                             FROM Fiscal_Year__c
                             WHERE Name = :fyName 
                             LIMIT 1];

        Fiscal_Period__c fp = new Fiscal_Period__c(Name='TestPeriod 1 - ' + system.Today().year(),
                                                   Start_Date__c=system.Today().addYears(-1),
                                                   End_Date__c=system.Today().addYears(-1),
                                                   ROW_Start_Date__c=system.Today(),
                                                   ROW_End_Date__c=system.Today().addDays(30),
                                                   Fiscal_Year__c=fy.Id);
        fpList.add(fp);
        Fiscal_Period__c fp2 = new Fiscal_Period__c(Name='TestPeriod 2 - ' + system.Today().year(), 
                                                    Start_Date__c=system.Today().addYears(-1),
                                                    End_Date__c=system.Today().addYears(-1),
                                                    ROW_Start_Date__c=system.Today().addDays(31),
                                                    ROW_End_Date__c=system.Today().addDays(60),
                                                    Fiscal_Year__c=fy.Id);
        fpList.add(fp2);
        insert fpList;
		*/
        Account a = new Account(Name='Test');
        insert a;

        Opportunity o = new Opportunity(Name='Test',
                                        AccountId=a.Id,
                                        CloseDate=system.Today(), 
                                        StageName='Qualification',
                                        Annual_Expected_Revenue__c=1,
                                        Global_Region__c = 'EMEAI');
        //Invoke
        insert o;

        //Check
        Opportunity testOpp = [SELECT Id,
                               Fiscal_Period__c
                               FROM Opportunity
                               WHERE Id = :o.Id
                               LIMIT 1];

        system.assertEquals(fp.Id, testOpp.Fiscal_Period__c);

        //Invoke Close Functionality
        o.StageName = 'Closed/Won';
        o.Reason_Won_Lost__c = 'No Decision';
        update o;

        //Check
        Opportunity testOpp2 = [SELECT Id, Fiscal_Period__c
                                FROM Opportunity
                                WHERE Id = :o.Id
                                LIMIT 1];

        system.assertEquals(fp.Id, testOpp2.Fiscal_Period__c);
    }
}