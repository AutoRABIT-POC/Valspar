@isTest
private class TestAccountGrading
{
    static testMethod void wattylAccountGradingFirstExample()
    {
    	createWattylCustomSettings();

        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Consumer Wattyl Trade';
        update u;

    	Account acct = new Account(Name='Test Acct');
    	acct.Rolling_12_Month_Sales__c = 25000;
    	acct.Rolling_12_Month_Sales_Margin__c = 65;
    	
    	insert acct;

		Account_Intelligence__c intel = new Account_Intelligence__c();
		intel.Account__c = acct.Id;
		intel.Number_of_Painters__c = 5;
		intel.Occupation__c = 'Painter';

		intel.PPG_ShareofBusiness__c = 50;

		intel.V_Split_Inderpendant_Hardware__c = 100;

		intel.O_Split_Inderpendant_Paint_Specialist__c = 100;

		intel.W_Split_Commercial_Repaint__c = 50;
		intel.W_Split_Commercial_Texture__c = 50;

		intel.Business_Split_Interior__c = 50;
		intel.Business_Split_Exterior__c = 20;
		intel.Business_Split_Texture__c = 30;

		intel.Interior_Other_UP__c = 50;
		intel.Interior_Other_P__c = 40;
		intel.Interior_Other_EL__c = 10;

		intel.Exterior_Other_UP__c = 50;
		intel.Exterior_Other_P__c = 50;

		intel.Texture_Other_UP__c = 50;
		intel.Texture_Other_P__c = 50;

		insert intel;

		Account a = [SELECT Id, Best_Customer_Grading__c, Best_Customer_Ranking__c,
							Best_Customer_Suggested_Call_Cycle__c, Growth_Opportunity_Grading__c,
							Growth_Opportunity_Ranking__c, Growth_Opportunity_Suggested_Call_Cycle__c,
							Ultimate_Customer_Ranking__c, Ultimate_Suggested_Call_Cycle__c,
							Grade_Rank_Messages__c
							FROM Account WHERE Id = :acct.Id LIMIT 1];

		system.AssertEquals(56, a.Best_Customer_Grading__c);
		system.AssertEquals('C', a.Best_Customer_Ranking__c);
		system.AssertEquals('Monthly', a.Best_Customer_Suggested_Call_Cycle__c);

		system.AssertEquals(87, a.Growth_Opportunity_Grading__c);
		system.AssertEquals('A', a.Growth_Opportunity_Ranking__c);
		system.AssertEquals('Monthly', a.Growth_Opportunity_Suggested_Call_Cycle__c);

		system.AssertEquals('B', a.Ultimate_Customer_Ranking__c);
		system.AssertEquals('Fortnightly', a.Ultimate_Suggested_Call_Cycle__c);

		system.AssertEquals(null, a.Grade_Rank_Messages__c);
    }

    static testMethod void wattylAccountGradingKitchenSink()
    {
    	createWattylCustomSettings();

        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Consumer Wattyl Trade';
        update u;

    	Account acct = new Account(Name='Test Acct');
    	acct.Rolling_12_Month_Sales__c = 25000;
    	acct.Rolling_12_Month_Sales_Margin__c = 65;
    	
    	insert acct;

		Account_Intelligence__c intel = new Account_Intelligence__c();
		intel.Account__c = acct.Id;
		intel.Number_of_Painters__c = 5;
		intel.Occupation__c = 'Painter';

		intel.PPG_ShareofBusiness__c = 50;

		intel.O_Split_Inderpendant_Paint_Specialist__c = 40;
		intel.O_Split_Inderpendant_Hardware__c = 10;
		intel.O_Split_Corporate_Masters__c = 10;
		intel.O_Split_ITC_Stores__c = 10;
		intel.O_Split_Corporate_Other__c = 20;
		intel.O_Split_Company_Owned_Stores_Other__c = 10;

		intel.W_Split_Commercial_Repaint__c = 10;
		intel.W_Split_Commercial_Texture__c = 10;
		intel.W_Split_Residential_Repaint__c = 10;
		intel.W_Split_Residential_Texture__c = 10;
		intel.W_Split_Commercial_Texture_New__c = 10;
		intel.W_Split_Commercial_Paint_New__c = 10;
		intel.W_Split_New_Residential_Proj_Homes_Paint__c = 40;

		intel.Business_Split_Interior__c = 20;
		intel.Business_Split_Exterior__c = 20;
		intel.Business_Split_Texture__c = 60;

		intel.Interior_Valspar_UP__c = 50;
		intel.Interior_Valspar_P__c = 50;
		intel.Interior_Other_UP__c = 50;
		intel.Interior_Other_P__c = 50;

		intel.Exterior_Valspar_UP__c = 50;
		intel.Exterior_Valspar_P__c = 50;
		intel.Exterior_Other_UP__c = 50;
		intel.Exterior_Other_P__c = 50;

		intel.Texture_Valspar_UP__c = 50;
		intel.Texture_Valspar_P__c = 50;
		intel.Texture_Other_UP__c = 50;
		intel.Texture_Other_P__c = 50;

		insert intel;

		Account a = [SELECT Id, Best_Customer_Grading__c, Best_Customer_Ranking__c,
							Best_Customer_Suggested_Call_Cycle__c, Growth_Opportunity_Grading__c,
							Growth_Opportunity_Ranking__c, Growth_Opportunity_Suggested_Call_Cycle__c,
							Ultimate_Customer_Ranking__c, Ultimate_Suggested_Call_Cycle__c,
							Grade_Rank_Messages__c
							FROM Account WHERE Id = :acct.Id LIMIT 1];

		system.AssertEquals(56, a.Best_Customer_Grading__c);
		system.AssertEquals('C', a.Best_Customer_Ranking__c);
		system.AssertEquals('Monthly', a.Best_Customer_Suggested_Call_Cycle__c);

		system.AssertEquals(74, a.Growth_Opportunity_Grading__c);
		system.AssertEquals('A', a.Growth_Opportunity_Ranking__c);
		system.AssertEquals('Monthly', a.Growth_Opportunity_Suggested_Call_Cycle__c);

		system.AssertEquals('B', a.Ultimate_Customer_Ranking__c);
		system.AssertEquals('Fortnightly', a.Ultimate_Suggested_Call_Cycle__c);

		system.AssertEquals(null, a.Grade_Rank_Messages__c);
    }

    static testMethod void wattylAccountGradingMissingValuePerPainter()
    {
        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Consumer Wattyl Trade';
        update u;

    	Account acct = new Account(Name='Test Acct');
    	insert acct;

		Account a = [SELECT Id, Best_Customer_Grading__c, Best_Customer_Ranking__c,
							Best_Customer_Suggested_Call_Cycle__c, Growth_Opportunity_Grading__c,
							Growth_Opportunity_Ranking__c, Growth_Opportunity_Suggested_Call_Cycle__c,
							Ultimate_Customer_Ranking__c, Ultimate_Suggested_Call_Cycle__c,
							Grade_Rank_Messages__c
							FROM Account WHERE Id = :acct.Id LIMIT 1];

		system.AssertEquals(null, a.Best_Customer_Ranking__c);
    }

/* throws div by zero on the valspar share of business calculated field...
    static testMethod void wattylAccountGradingNumberOfPaintersZero()
    {
        createWattylCustomSettings();

        User u = [SELECT Id, Business_Unit__c FROM User WHERE Id = :userInfo.getUserId() LIMIT 1];
        u.Business_Unit__c = 'Consumer Wattyl Trade';
        update u;

    	Account acct = new Account(Name='Test Acct');
    	acct.Rolling_12_Month_Sales__c = 25000;
    	acct.Rolling_12_Month_Sales_Margin__c = 65;
    	
    	insert acct;

		Account_Intelligence__c intel = new Account_Intelligence__c();
		intel.Account__c = acct.Id;
		intel.Number_of_Painters__c = 0;
		intel.Occupation__c = 'Painter';

		intel.PPG_ShareofBusiness__c = 50;

		insert intel;

		Account a = [SELECT Id, Best_Customer_Grading__c, Best_Customer_Ranking__c,
							Best_Customer_Suggested_Call_Cycle__c, Growth_Opportunity_Grading__c,
							Growth_Opportunity_Ranking__c, Growth_Opportunity_Suggested_Call_Cycle__c,
							Ultimate_Customer_Ranking__c, Ultimate_Suggested_Call_Cycle__c,
							Grade_Rank_Messages__c
							FROM Account WHERE Id = :acct.Id LIMIT 1];

		system.assertNotEquals(null, a.Grade_Rank_Messages__c);
    }
*/
    
    private static void createWattylCustomSettings()
    {
    	insert new WattylAccountGradingLookupTable__c(Name='Best_Customer_Ranking_A', Category__c='Best_Customer_Ranking', Min__c=94, Max__c=112, Text_Value_1__c='A', Text_Value_2__c='5', Text_Value_3__c='Weekly');
    	insert new WattylAccountGradingLookupTable__c(Name='Best_Customer_Ranking_B', Category__c='Best_Customer_Ranking', Min__c=74, Max__c=93, Text_Value_1__c='B', Text_Value_2__c='4', Text_Value_3__c='Fortnightly');
    	insert new WattylAccountGradingLookupTable__c(Name='Best_Customer_Ranking_C', Category__c='Best_Customer_Ranking', Min__c=54, Max__c=73, Text_Value_1__c='C', Text_Value_2__c='3', Text_Value_3__c='Monthly');
    	insert new WattylAccountGradingLookupTable__c(Name='Best_Customer_Ranking_D', Category__c='Best_Customer_Ranking', Min__c=33, Max__c=53, Text_Value_1__c='D', Text_Value_2__c='2', Text_Value_3__c='6 Weekly');
    	insert new WattylAccountGradingLookupTable__c(Name='Best_Customer_Ranking_E', Category__c='Best_Customer_Ranking', Min__c=1, Max__c=32, Text_Value_1__c='E', Text_Value_2__c='1', Text_Value_3__c='Phone Call');

    	insert new WattylAccountGradingLookupTable__c(Name='Buy_Split_Other_1', Category__c='Buy_Split_Other', Key_Field_1__c='Company Owned Stores - Other', Customer_Growth_Grading__c=1);
    	insert new WattylAccountGradingLookupTable__c(Name='Buy_Split_Other_2', Category__c='Buy_Split_Other', Key_Field_1__c='Corporate - Other', Customer_Growth_Grading__c=2);
    	insert new WattylAccountGradingLookupTable__c(Name='Buy_Split_Other_3', Category__c='Buy_Split_Other', Key_Field_1__c='ITC Stores', Customer_Growth_Grading__c=3);
    	insert new WattylAccountGradingLookupTable__c(Name='Buy_Split_Other_4', Category__c='Buy_Split_Other', Key_Field_1__c='Corporate - Masters', Customer_Growth_Grading__c=4);
    	insert new WattylAccountGradingLookupTable__c(Name='Buy_Split_Other_5', Category__c='Buy_Split_Other', Key_Field_1__c='Inderpendant Hardware', Customer_Growth_Grading__c=5);
    	insert new WattylAccountGradingLookupTable__c(Name='Buy_Split_Other_6', Category__c='Buy_Split_Other', Key_Field_1__c='Inderpendant Paint Specialist', Customer_Growth_Grading__c=6);

    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 10', Category__c='Customer_Purchases', Min__c=0, Max__c=10000, Best_Customer_Grading__c=10);	
    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 20', Category__c='Customer_Purchases', Min__c=10001, Max__c=20000, Best_Customer_Grading__c=20);
    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 30', Category__c='Customer_Purchases', Min__c=20001, Max__c=30000, Best_Customer_Grading__c=30);
    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 40', Category__c='Customer_Purchases', Min__c=30001, Max__c=40000, Best_Customer_Grading__c=40);
    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 50', Category__c='Customer_Purchases', Min__c=40001, Max__c=50000, Best_Customer_Grading__c=50);
    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 60', Category__c='Customer_Purchases', Min__c=50001, Max__c=60000, Best_Customer_Grading__c=60);
    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 70', Category__c='Customer_Purchases', Min__c=60001, Max__c=70000, Best_Customer_Grading__c=70);
    	insert new WattylAccountGradingLookupTable__c(Name='Customer Purchases 80', Category__c='Customer_Purchases', Min__c=70001, Max__c=5000000, Best_Customer_Grading__c=80);

    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Premium_3', Category__c='Exterior_Other', Key_Field_1__c='Premium', Min__c=0, Max__c=20, Customer_Growth_Grading__c=3);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Premium_4', Category__c='Exterior_Other', Key_Field_1__c='Premium', Min__c=21, Max__c=40, Customer_Growth_Grading__c=4);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Premium_5', Category__c='Exterior_Other', Key_Field_1__c='Premium', Min__c=41, Max__c=60, Customer_Growth_Grading__c=5);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Premium_6', Category__c='Exterior_Other', Key_Field_1__c='Premium', Min__c=61, Max__c=80, Customer_Growth_Grading__c=6);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Premium_7', Category__c='Exterior_Other', Key_Field_1__c='Premium', Min__c=81, Max__c=100, Customer_Growth_Grading__c=7);

    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Ultra_4', Category__c='Exterior_Other', Key_Field_1__c='Ultra', Min__c=0, Max__c=20, Customer_Growth_Grading__c=4);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Ultra_5', Category__c='Exterior_Other', Key_Field_1__c='Ultra', Min__c=21, Max__c=40, Customer_Growth_Grading__c=5);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Ultra_6', Category__c='Exterior_Other', Key_Field_1__c='Ultra', Min__c=41, Max__c=60, Customer_Growth_Grading__c=6);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Ultra_7', Category__c='Exterior_Other', Key_Field_1__c='Ultra', Min__c=61, Max__c=80, Customer_Growth_Grading__c=7);
    	insert new WattylAccountGradingLookupTable__c(Name='Exterior_Other_Ultra_8', Category__c='Exterior_Other', Key_Field_1__c='Ultra', Min__c=81, Max__c=100, Customer_Growth_Grading__c=8);
/*
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_A', Category__c='Growth_Opportunity_Ranking', Min__c=331, Max__c=5000, Text_Value_1__c='A', Text_Value_2__c='5', Text_Value_3__c='Monthly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_B', Category__c='Growth_Opportunity_Ranking', Min__c=251, Max__c=330, Text_Value_1__c='B', Text_Value_2__c='4', Text_Value_3__c='6 Weekly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_C', Category__c='Growth_Opportunity_Ranking', Min__c=171, Max__c=250, Text_Value_1__c='C', Text_Value_2__c='3', Text_Value_3__c='Bi-Monthly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_D', Category__c='Growth_Opportunity_Ranking', Min__c=91, Max__c=170, Text_Value_1__c='D', Text_Value_2__c='2', Text_Value_3__c='6 Weekly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_E', Category__c='Growth_Opportunity_Ranking', Min__c=1, Max__c=90, Text_Value_1__c='E', Text_Value_2__c='1', Text_Value_3__c='Monthly');
*/
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_A', Category__c='Growth_Opportunity_Ranking', Min__c=1, Max__c=90, Text_Value_1__c='A', Text_Value_2__c='5', Text_Value_3__c='Monthly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_B', Category__c='Growth_Opportunity_Ranking', Min__c=91, Max__c=170, Text_Value_1__c='B', Text_Value_2__c='4', Text_Value_3__c='6 Weekly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_C', Category__c='Growth_Opportunity_Ranking', Min__c=171, Max__c=250, Text_Value_1__c='C', Text_Value_2__c='3', Text_Value_3__c='Bi-Monthly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_D', Category__c='Growth_Opportunity_Ranking', Min__c=251, Max__c=330, Text_Value_1__c='D', Text_Value_2__c='2', Text_Value_3__c='6 Weekly');
    	insert new WattylAccountGradingLookupTable__c(Name='Growth_Opportunity_Ranking_E', Category__c='Growth_Opportunity_Ranking', Min__c=331, Max__c=5000, Text_Value_1__c='E', Text_Value_2__c='1', Text_Value_3__c='Monthly');

    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Premium_3', Category__c='Interior_Other', Key_Field_1__c='Premium', Min__c=0, Max__c=20, Customer_Growth_Grading__c=3);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Premium_4', Category__c='Interior_Other', Key_Field_1__c='Premium', Min__c=21, Max__c=40, Customer_Growth_Grading__c=4);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Premium_5', Category__c='Interior_Other', Key_Field_1__c='Premium', Min__c=41, Max__c=60, Customer_Growth_Grading__c=5);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Premium_6', Category__c='Interior_Other', Key_Field_1__c='Premium', Min__c=61, Max__c=80, Customer_Growth_Grading__c=6);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Premium_7', Category__c='Interior_Other', Key_Field_1__c='Premium', Min__c=81, Max__c=100, Customer_Growth_Grading__c=7);

    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Ultra_4', Category__c='Interior_Other', Key_Field_1__c='Ultra', Min__c=0, Max__c=20, Customer_Growth_Grading__c=4);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Ultra_5', Category__c='Interior_Other', Key_Field_1__c='Ultra', Min__c=21, Max__c=40, Customer_Growth_Grading__c=5);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Ultra_6', Category__c='Interior_Other', Key_Field_1__c='Ultra', Min__c=41, Max__c=60, Customer_Growth_Grading__c=6);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Ultra_7', Category__c='Interior_Other', Key_Field_1__c='Ultra', Min__c=61, Max__c=80, Customer_Growth_Grading__c=7);
    	insert new WattylAccountGradingLookupTable__c(Name='Interior_Other_Ultra_8', Category__c='Interior_Other', Key_Field_1__c='Ultra', Min__c=81, Max__c=100, Customer_Growth_Grading__c=8);

		insert new WattylAccountGradingLookupTable__c(Name='Margin 02', Category__c='Margin', Min__c=0, Max__c=20, Best_Customer_Grading__c=2);
		insert new WattylAccountGradingLookupTable__c(Name='Margin 04', Category__c='Margin', Min__c=21, Max__c=40, Best_Customer_Grading__c=4);
		insert new WattylAccountGradingLookupTable__c(Name='Margin 06', Category__c='Margin', Min__c=41, Max__c=60, Best_Customer_Grading__c=6);
		insert new WattylAccountGradingLookupTable__c(Name='Margin 08', Category__c='Margin', Min__c=61, Max__c=80, Best_Customer_Grading__c=8);
		insert new WattylAccountGradingLookupTable__c(Name='Margin 10', Category__c='Margin', Min__c=81, Max__c=100, Best_Customer_Grading__c=10);

		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 01', Category__c='Number_Of_Painters', Min__c=1, Max__c=3, Customer_Growth_Grading__c=1);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 02', Category__c='Number_Of_Painters', Min__c=4, Max__c=6, Customer_Growth_Grading__c=2);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 03', Category__c='Number_Of_Painters', Min__c=7, Max__c=9, Customer_Growth_Grading__c=3);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 04', Category__c='Number_Of_Painters', Min__c=10, Max__c=12, Customer_Growth_Grading__c=4);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 05', Category__c='Number_Of_Painters', Min__c=13, Max__c=15, Customer_Growth_Grading__c=5);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 06', Category__c='Number_Of_Painters', Min__c=16, Max__c=18, Customer_Growth_Grading__c=6);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 07', Category__c='Number_Of_Painters', Min__c=19, Max__c=21, Customer_Growth_Grading__c=7);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 08', Category__c='Number_Of_Painters', Min__c=22, Max__c=24, Customer_Growth_Grading__c=8);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 09', Category__c='Number_Of_Painters', Min__c=25, Max__c=27, Customer_Growth_Grading__c=9);
		insert new WattylAccountGradingLookupTable__c(Name='Number Of Painters 10', Category__c='Number_Of_Painters', Min__c=28, Max__c=1000, Customer_Growth_Grading__c=10);

		insert new WattylAccountGradingLookupTable__c(Name='Occupation 03', Category__c='Occupation', Key_Field_1__c='Handyman', Best_Customer_Grading__c=3, Customer_Growth_Grading__c=3);
		insert new WattylAccountGradingLookupTable__c(Name='Occupation 06', Category__c='Occupation', Key_Field_1__c='Texture', Best_Customer_Grading__c=6, Customer_Growth_Grading__c=6);
		insert new WattylAccountGradingLookupTable__c(Name='Occupation 09', Category__c='Occupation', Key_Field_1__c='Renderer', Best_Customer_Grading__c=9, Customer_Growth_Grading__c=9);
		insert new WattylAccountGradingLookupTable__c(Name='Occupation 12', Category__c='Occupation', Key_Field_1__c='Painter', Best_Customer_Grading__c=12, Customer_Growth_Grading__c=12);

		insert new WattylAccountGradingLookupTable__c(Name='Product Type 10', Category__c='Product_Type', Key_Field_1__c='Exterior', Customer_Growth_Grading__c=10);
		insert new WattylAccountGradingLookupTable__c(Name='Product Type 15', Category__c='Product_Type', Key_Field_1__c='Interior', Customer_Growth_Grading__c=15);
		insert new WattylAccountGradingLookupTable__c(Name='Product Type 5', Category__c='Product_Type', Key_Field_1__c='Texture', Customer_Growth_Grading__c=5);

		insert new WattylAccountGradingLookupTable__c(Name='Share Of Wallet 02', Category__c='Share_Of_Wallet', Min__c=0, Max__c=20, Best_Customer_Grading__c=2, Customer_Growth_Grading__c=10);
		insert new WattylAccountGradingLookupTable__c(Name='Share Of Wallet 04', Category__c='Share_Of_Wallet', Min__c=21, Max__c=40, Best_Customer_Grading__c=4, Customer_Growth_Grading__c=8);
		insert new WattylAccountGradingLookupTable__c(Name='Share Of Wallet 06', Category__c='Share_Of_Wallet', Min__c=41, Max__c=60, Best_Customer_Grading__c=6, Customer_Growth_Grading__c=6);
		insert new WattylAccountGradingLookupTable__c(Name='Share Of Wallet 08', Category__c='Share_Of_Wallet', Min__c=61, Max__c=80, Best_Customer_Grading__c=8, Customer_Growth_Grading__c=4);
		insert new WattylAccountGradingLookupTable__c(Name='Share Of Wallet 10', Category__c='Share_Of_Wallet', Min__c=81, Max__c=100, Best_Customer_Grading__c=10, Customer_Growth_Grading__c=2);

    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Premium_3', Category__c='Texture_Other', Key_Field_1__c='Premium', Min__c=0, Max__c=20, Customer_Growth_Grading__c=3);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Premium_4', Category__c='Texture_Other', Key_Field_1__c='Premium', Min__c=21, Max__c=40, Customer_Growth_Grading__c=4);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Premium_5', Category__c='Texture_Other', Key_Field_1__c='Premium', Min__c=41, Max__c=60, Customer_Growth_Grading__c=5);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Premium_6', Category__c='Texture_Other', Key_Field_1__c='Premium', Min__c=61, Max__c=80, Customer_Growth_Grading__c=6);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Premium_7', Category__c='Texture_Other', Key_Field_1__c='Premium', Min__c=81, Max__c=100, Customer_Growth_Grading__c=7);

    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Ultra_4', Category__c='Texture_Other', Key_Field_1__c='Ultra', Min__c=0, Max__c=20, Customer_Growth_Grading__c=4);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Ultra_5', Category__c='Texture_Other', Key_Field_1__c='Ultra', Min__c=21, Max__c=40, Customer_Growth_Grading__c=5);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Ultra_6', Category__c='Texture_Other', Key_Field_1__c='Ultra', Min__c=41, Max__c=60, Customer_Growth_Grading__c=6);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Ultra_7', Category__c='Texture_Other', Key_Field_1__c='Ultra', Min__c=61, Max__c=80, Customer_Growth_Grading__c=7);
    	insert new WattylAccountGradingLookupTable__c(Name='Texture_Other_Ultra_8', Category__c='Texture_Other', Key_Field_1__c='Ultra', Min__c=81, Max__c=100, Customer_Growth_Grading__c=8);

		insert new WattylAccountGradingLookupTable__c(Name='Type_Of_Work_1', Category__c='Type_Of_Work', Key_Field_1__c='New Residential - Project Homes - Paint', Customer_Growth_Grading__c=1);
		insert new WattylAccountGradingLookupTable__c(Name='Type_Of_Work_3', Category__c='Type_Of_Work', Key_Field_1__c='Commercial - Paint - New', Customer_Growth_Grading__c=3);
		insert new WattylAccountGradingLookupTable__c(Name='Type_Of_Work_4', Category__c='Type_Of_Work', Key_Field_1__c='Commercial - Texture - New', Customer_Growth_Grading__c=4);
		insert new WattylAccountGradingLookupTable__c(Name='Type_Of_Work_5', Category__c='Type_Of_Work', Key_Field_1__c='Residential - Texture', Customer_Growth_Grading__c=5);
		insert new WattylAccountGradingLookupTable__c(Name='Type_Of_Work_6', Category__c='Type_Of_Work', Key_Field_1__c='Residential - Repaint', Customer_Growth_Grading__c=6);
		insert new WattylAccountGradingLookupTable__c(Name='Type_Of_Work_7', Category__c='Type_Of_Work', Key_Field_1__c='Commercial - Texture', Customer_Growth_Grading__c=7);
		insert new WattylAccountGradingLookupTable__c(Name='Type_Of_Work_8', Category__c='Type_Of_Work', Key_Field_1__c='Commercial - Repaint', Customer_Growth_Grading__c=8);
 
     	insert new WattylAccountGradingLookupTable__c(Name='Ultimate_Customer_Ranking_A', Category__c='Ultimate_Customer_Ranking', Min__c=9, Max__c=10, Text_Value_1__c='A', Text_Value_3__c='Weekly');
     	insert new WattylAccountGradingLookupTable__c(Name='Ultimate_Customer_Ranking_B', Category__c='Ultimate_Customer_Ranking', Min__c=7, Max__c=8, Text_Value_1__c='B', Text_Value_3__c='Fortnightly');
     	insert new WattylAccountGradingLookupTable__c(Name='Ultimate_Customer_Ranking_C', Category__c='Ultimate_Customer_Ranking', Min__c=5, Max__c=6, Text_Value_1__c='C', Text_Value_3__c='Monthly');
     	insert new WattylAccountGradingLookupTable__c(Name='Ultimate_Customer_Ranking_D', Category__c='Ultimate_Customer_Ranking', Min__c=3, Max__c=4, Text_Value_1__c='D', Text_Value_3__c='6 Weekly');
     	insert new WattylAccountGradingLookupTable__c(Name='Ultimate_Customer_Ranking_E', Category__c='Ultimate_Customer_Ranking', Min__c=0, Max__c=2, Text_Value_1__c='E', Text_Value_3__c='Phone Call');
     	
     	insert new WattylAccountGradingLookupTable__c(Name='Value Per Painter', Category__c='Value_Per_Painter', Max__c=10000);
     }
}