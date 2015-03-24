public class AccountGrading
{
	private enum GradingType {BEST_CUSTOMER, CUSTOMER_GROWTH, OTHER}
	private static Decimal valuePerPainter;
	private static Decimal OTHER_COMPANY_BUY_DIVISOR = 10000;

    private List<WattylAccountGradingLookupTable__c> lookups;
    private List<Account> accounts;
    private Map<String, Account_Intelligence__c> accountIntelligenceMap = new Map<String, Account_Intelligence__c>();

    private Decimal bestCustomerGrading;
	private Decimal growthOpportunityGrading;
	private List<String> errors = new List<String>();
    private Account_Intelligence__c intel;

    public AccountGrading()
    {
    }

	private Boolean initialize(Account[] accountIds)
	{
		accounts = [SELECT Id, Name, Rolling_12_Month_Sales__c, Rolling_12_Month_Sales_Margin__c 
                    FROM Account
                    WHERE Id IN :accountIds
                      AND Business_Unit__c = 'Consumer Wattyl Trade'];

		if (accounts.isEmpty())
		{
			System.debug('No Wattyl accounts in the list, exiting...');
			return false;
		}

    	Map<String, WattylAccountGradingLookupTable__c> lookupMap = WattylAccountGradingLookupTable__c.getAll();
    	lookups = lookupMap.values();

		for (Account_Intelligence__c intel : [SELECT Account__c, Number_of_Painters__c, Occupation__c,
    												 O_Split_Inderpendant_Paint_Specialist__c, O_Split_Inderpendant_Hardware__c,
    												 O_Split_Corporate_Masters__c, Wattyl_NZ_O_Split_Corporate_Retail__c, O_Split_ITC_Stores__c,
    												 O_Split_Corporate_Other__c, O_Split_Company_Owned_Stores_Other__c,
    												 W_Split_Commercial_Repaint__c, W_Split_Commercial_Texture__c,
    												 W_Split_Residential_Repaint__c, W_Split_Residential_Texture__c,
    												 W_Split_Commercial_Texture_New__c, W_Split_Commercial_Paint_New__c,
    												 W_Split_New_Residential_Proj_Homes_Paint__c,
    												 Business_Split_Interior__c, Business_Split_Exterior__c, Business_Split_Texture__c,
    												 Interior_Valspar_UP__c, Interior_Valspar_P__c, Interior_Valspar_T__c, Interior_Valspar_EL__c,
    												 Exterior_Valspar_UP__c, Exterior_Valspar_P__c, Exterior_Valspar_T__c, Exterior_Valspar_EL__c,
    												 Texture_Valspar_UP__c, Texture_Valspar_P__c, Texture_Valspar_T__c, Texture_Valspar_EL__c,
    												 Interior_Other_UP__c, Interior_Other_P__c, Interior_Other_T__c, Interior_Other_EL__c,
    												 Exterior_Other_UP__c, Exterior_Other_P__c, Exterior_Other_T__c, Exterior_Other_EL__c,
    												 Texture_Other_UP__c, Texture_Other_P__c, Texture_Other_T__c, Texture_Other_EL__c
    										  FROM Account_Intelligence__c
    										  WHERE Account__c in :accounts])
	    {
	   		accountIntelligenceMap.put(intel.Account__c, intel);
	    }
	    
	    WattylAccountGradingLookupTable__c valuePerPainterLookup = getLookupRecord('Value_Per_Painter');

		if (valuePerPainterLookup == null)
		{
			return false;
		}

	    valuePerPainter = valuePerPainterLookup.Max__c;

	    return true;
	}

    public void calculateGradesAndRanks(Account[] accountIds)
    {
		if (!initialize(accountIds))
		{
			return;
		}

        for (Account acct : accounts)
        {
        	System.debug('Scoring Wattyl Account ' + acct.Name + '...');

        	bestCustomerGrading = null;
        	growthOpportunityGrading = null;
        	errors.clear();

        	intel = accountIntelligenceMap.get(acct.Id);
			//sales = salesDetailsMap.get(acct.Id);

			if (intel != null)
			{
				bestCustomerGrading = 0;
				growthOpportunityGrading = 0;

	            // Best Customer Grading = C10 (Customer Purchases lookup - Customer_Purchases)
	            //                       + C12 (Margin lookup - Margin)
	            //                       + C15 (Share of Wallet)
	            //                       + SUM(C19:C22) (Occupation Score)

				Decimal unrealizedValue = null;
				Decimal shareOfWallet = null;

				addScore(GradingType.BEST_CUSTOMER, 'Customer Purchases', getGrading('Customer_Purchases', GradingType.BEST_CUSTOMER, acct.Rolling_12_Month_Sales__c));
				addScore(GradingType.BEST_CUSTOMER, 'Margin', getGrading('Margin', GradingType.BEST_CUSTOMER, acct.Rolling_12_Month_Sales_Margin__c));

				Decimal extendedValue = intel.Number_of_Painters__c * valuePerPainter;

				if (acct.Rolling_12_Month_Sales__c > extendedValue)
				{
					logError('Rolling 12 month sales (' + acct.Rolling_12_Month_Sales__c + ') is greater than the expected annual sales based on number of painters (' + extendedValue + ', calculated by ' + intel.Number_of_Painters__c + ' painters at ' + valuePerPainter + ' apiece).  Please validate the number of painters.');
					shareOfWallet = 100;
					unrealizedValue = 0;
				}
				else if (extendedValue == 0)
				{
					if (intel.Number_of_Painters__c == 0)
					{
						logError('Number of painters is zero, cannot calculate share of wallet, and some other calculations may be incomplete.  Please validate the number of painters.');
					}
					else if (valuePerPainter == 0)
					{
						logError('Value per painter is zero, cannot calculate share of wallet, and some other calculations may be incomplete.  Please configure the Value_Per_Painter lookup record.');
					}
					
					shareOfWallet = 0;
					unrealizedValue = 0;
				}
				else
				{
					shareOfWallet = acct.Rolling_12_Month_Sales__c / extendedValue * 100;
					unrealizedValue = extendedValue - acct.Rolling_12_Month_Sales__c;
				}

				System.debug('    Share of Wallet = ' + shareOfWallet);
				addScore(GradingType.BEST_CUSTOMER, 'Share Of Wallet (Best Customer)', getGrading('Share_Of_Wallet', GradingType.BEST_CUSTOMER, shareOfWallet));					
				addScore(GradingType.BEST_CUSTOMER, 'Occupation (Best Customer)', getGrading('Occupation', GradingType.BEST_CUSTOMER, intel.Occupation__c));


	            // Growth Opportunity Grading = D5 (# painters on the brush)
	            //                            + D15 (Share of Wallet)
	            //                            + SUM(C19:C22) (Occupation Score)
	            //                            + D50 - SUM(D44:D49) (From other companies, where do you buy your paint from)
	            //                            + D62 - SUM(D54:D61) (What type of work do you do)
	            //                            + D69 - SUM(D66:D68) (What is the split of your business - interior/exterior/texture)
	            //                            + D80 - SUM(D76:D79) (What type of other interior paint products do you mostly use - ultra premium)
	            //                            + G80 - SUM(G76:G79) (What type of other interior paint products do you mostly use - premium)
	            //                            + D99 - SUM(D95:D98) (What type of other exterior paint products do you mostly use - ultra premium)
	            //                            + G99 - SUM(G95:G98) (What type of other exterior paint products do you mostly use - premium)
	            //                            + D118 - SUM(D114:D117) (What type of other texture paint products do you mostly use - ultra premium)
	            //                            + G118 - SUM(D114:D117) (What type of other texture paint products do you mostly use - premium)

	            addScore(GradingType.CUSTOMER_GROWTH, '# Painters on the Brush', getGrading('Number_Of_Painters', GradingType.CUSTOMER_GROWTH, intel.Number_of_Painters__c));

				if (shareOfWallet != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Share of Wallet (Growth Opportunity)', getGrading('Share_Of_Wallet', GradingType.CUSTOMER_GROWTH, shareOfWallet));
				}
				
				addScore(GradingType.CUSTOMER_GROWTH, 'Occupation (Growth Opportunity)', getGrading('Occupation', GradingType.CUSTOMER_GROWTH, intel.Occupation__c));
				
				if (unrealizedValue != null)
				{
					// Other company purchases split by where purchased

					if (intel.O_Split_Inderpendant_Paint_Specialist__c != null)
					{
						System.debug('Inderdependant_Paint_Specialist = ' + intel.O_Split_Inderpendant_Paint_Specialist__c);
						addScore(GradingType.CUSTOMER_GROWTH, 'Inderpendant Paint Specialist', Math.round(unrealizedValue * intel.O_Split_Inderpendant_Paint_Specialist__c/100 * getGrading('Buy_Split_Other', GradingType.CUSTOMER_GROWTH, 'Inderpendant Paint Specialist') / OTHER_COMPANY_BUY_DIVISOR));
					}
					if (intel.O_Split_Inderpendant_Hardware__c != null)
					{
						addScore(GradingType.CUSTOMER_GROWTH, 'Inderpendant Hardware', Math.round(unrealizedValue * intel.O_Split_Inderpendant_Hardware__c/100 * getGrading('Buy_Split_Other', GradingType.CUSTOMER_GROWTH, 'Inderpendant Hardware') / OTHER_COMPANY_BUY_DIVISOR));
					}
					if (intel.O_Split_Corporate_Masters__c != null)
					{
						addScore(GradingType.CUSTOMER_GROWTH, 'Corporate - Masters', Math.round(unrealizedValue * intel.O_Split_Corporate_Masters__c/100 * getGrading('Buy_Split_Other', GradingType.CUSTOMER_GROWTH, 'Corporate - Masters') / OTHER_COMPANY_BUY_DIVISOR));
					}
					if (intel.O_Split_ITC_Stores__c != null)
					{
						addScore(GradingType.CUSTOMER_GROWTH, 'ITC Stores', Math.round(unrealizedValue * intel.O_Split_ITC_Stores__c/100 * getGrading('Buy_Split_Other', GradingType.CUSTOMER_GROWTH, 'ITC Stores') / OTHER_COMPANY_BUY_DIVISOR));
					}
					if (intel.O_Split_Corporate_Other__c != null)
					{
						addScore(GradingType.CUSTOMER_GROWTH, 'Corporate - Other', Math.round(unrealizedValue * intel.O_Split_Corporate_Other__c/100 * getGrading('Buy_Split_Other', GradingType.CUSTOMER_GROWTH, 'Corporate - Other') / OTHER_COMPANY_BUY_DIVISOR));
					}
					if (intel.O_Split_Company_Owned_Stores_Other__c != null)
					{
						addScore(GradingType.CUSTOMER_GROWTH, 'Company Owned Stores - Other', Math.round(unrealizedValue * intel.O_Split_Company_Owned_Stores_Other__c/100 * getGrading('Buy_Split_Other', GradingType.CUSTOMER_GROWTH, 'Company Owned Stores - Other') / OTHER_COMPANY_BUY_DIVISOR));
					}
                    
                    if (intel.Wattyl_NZ_O_Split_Corporate_Retail__c != null)
					{
						addScore(GradingType.CUSTOMER_GROWTH, 'Corporate - Retail', Math.round(unrealizedValue * intel.Wattyl_NZ_O_Split_Corporate_Retail__c/100 * getGrading('Buy_Split_Other', GradingType.CUSTOMER_GROWTH, 'Corporate - Retail') / OTHER_COMPANY_BUY_DIVISOR));
					}
				}

				// Split by type of work

				if (intel.W_Split_Commercial_Repaint__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Commercial - Repaint', Math.round(intel.W_Split_Commercial_Repaint__c/100 * getGrading('Type_Of_Work', GradingType.CUSTOMER_GROWTH, 'Commercial - Repaint')));
				}
				if (intel.W_Split_Commercial_Texture__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Commercial - Texture', Math.round(intel.W_Split_Commercial_Texture__c/100 * getGrading('Type_Of_Work', GradingType.CUSTOMER_GROWTH, 'Commercial - Texture')));
				}
				if (intel.W_Split_Residential_Repaint__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Residential - Repaint', Math.round(intel.W_Split_Residential_Repaint__c/100 * getGrading('Type_Of_Work', GradingType.CUSTOMER_GROWTH, 'Residential - Repaint')));
				}
				if (intel.W_Split_Residential_Texture__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Residential - Texture', Math.round(intel.W_Split_Residential_Texture__c/100 * getGrading('Type_Of_Work', GradingType.CUSTOMER_GROWTH, 'Residential - Texture')));
				}
				if (intel.W_Split_Commercial_Texture_New__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Commercial - Texture - New', Math.round(intel.W_Split_Commercial_Texture_New__c/100 * getGrading('Type_Of_Work', GradingType.CUSTOMER_GROWTH, 'Commercial - Texture - New')));
				}
				if (intel.W_Split_Commercial_Paint_New__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Commercial - Paint - New', Math.round(intel.W_Split_Commercial_Paint_New__c/100 * getGrading('Type_Of_Work', GradingType.CUSTOMER_GROWTH, 'Commercial - Paint - New')));
				}
				if (intel.W_Split_New_Residential_Proj_Homes_Paint__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'New Residential - Project Homes - Paint', Math.round(intel.W_Split_New_Residential_Proj_Homes_Paint__c/100 * getGrading('Type_Of_Work', GradingType.CUSTOMER_GROWTH, 'New Residential - Project Homes - Paint')));
				}

				// Split by product type

				if (intel.Business_Split_Interior__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Interior', Math.round(intel.Business_Split_Interior__c/100 * getGrading('Product_Type', GradingType.CUSTOMER_GROWTH, 'Interior')));
				}
				if (intel.Business_Split_Exterior__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Exterior', Math.round(intel.Business_Split_Exterior__c/100 * getGrading('Product_Type', GradingType.CUSTOMER_GROWTH, 'Exterior')));
				}
				if (intel.Business_Split_Texture__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Texture', Math.round(intel.Business_Split_Texture__c/100 * getGrading('Product_Type', GradingType.CUSTOMER_GROWTH, 'Texture')));
				}

				// Split by product type - Interior
				
				if (intel.Interior_Other_UP__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Interior Other Ultra Premium', getGrading('Interior_Other', GradingType.CUSTOMER_GROWTH, 'Ultra', intel.Interior_Other_UP__c));
				}
				if (intel.Interior_Other_P__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Interior Other Premium', getGrading('Interior_Other', GradingType.CUSTOMER_GROWTH, 'Premium', intel.Interior_Other_P__c));
				}

				// Split by product type - Exterior

				if (intel.Exterior_Other_UP__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Exterior Other Ultra Premium', getGrading('Exterior_Other', GradingType.CUSTOMER_GROWTH, 'Ultra', intel.Exterior_Other_UP__c));
				}
				if (intel.Exterior_Other_P__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Exterior Other Premium', getGrading('Exterior_Other', GradingType.CUSTOMER_GROWTH, 'Premium', intel.Exterior_Other_P__c));
				}

				// Split by product type - Texture

				if (intel.Texture_Other_UP__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Texture Other Ultra Premium', getGrading('Texture_Other', GradingType.CUSTOMER_GROWTH, 'Ultra', intel.Texture_Other_UP__c));
				}
				if (intel.Texture_Other_P__c != null)
				{
					addScore(GradingType.CUSTOMER_GROWTH, 'Texture Other Premium', getGrading('Texture_Other', GradingType.CUSTOMER_GROWTH, 'Premium', intel.Texture_Other_P__c));
				}
			}
			else
			{
				logError('No account intelligence found, cannot calculate account grades or ranks');
			}


			// Finally assign best customer grading, ranking and suggested call cycle

            String bestCustomerRanking = null;
            String bestCustomerRanking2 = null;
            String bestCustomerSuggestedCallCycle = null;

			if (bestCustomerGrading != null)
			{
				WattylAccountGradingLookupTable__c bestCustomerRankingLookup = getLookupRecord('Best_Customer_Ranking', bestCustomerGrading);

				if (bestCustomerRankingLookup != null)
				{
					bestCustomerRanking = bestCustomerRankingLookup.Text_Value_1__c;
					bestCustomerRanking2 = bestCustomerRankingLookup.Text_Value_2__c;
					bestCustomerSuggestedCallCycle = bestCustomerRankingLookup.Text_Value_3__c;
				}
				else
				{
					logError('Could not calculate Best Customer ranking & call frequency');
				}
			}
			
            acct.Best_Customer_Grading__c = bestCustomerGrading;
			acct.Best_Customer_Ranking__c = bestCustomerRanking;
			acct.Best_Customer_Suggested_Call_Cycle__c = bestCustomerSuggestedCallCycle;


			// Finally assign growth opportunity grading, ranking and suggested call cycle

            String growthOpportunityRanking = null;
            String growthOpportunityRanking2 = null;
            String growthOpportunitySuggestedCallCycle = null;

			if (growthOpportunityGrading != null)
			{
				WattylAccountGradingLookupTable__c growthOpportunityRankingLookup = getLookupRecord('Growth_Opportunity_Ranking', growthOpportunityGrading);

				if (growthOpportunityRankingLookup != null)
				{
					growthOpportunityRanking = growthOpportunityRankingLookup.Text_Value_1__c;
					growthOpportunityRanking2 = growthOpportunityRankingLookup.Text_Value_2__c;
					growthOpportunitySuggestedCallCycle = growthOpportunityRankingLookup.Text_Value_3__c;
				}
				else
				{
					logError('Could not calculate Growth Opportunity ranking & call frequency');
				}
			}
			
            acct.Growth_Opportunity_Grading__c = growthOpportunityGrading;
			acct.Growth_Opportunity_Ranking__c = growthOpportunityRanking;
			acct.Growth_Opportunity_Suggested_Call_Cycle__c = growthOpportunitySuggestedCallCycle;


			// And now, assign ultimate grading, ranking and suggested call cycle

			String ultimateCustomerRanking = null;
			Decimal ultimateCustomerRanking2 = 0;
			String ultimateSuggestedCallCycle;

			if (bestCustomerRanking2 != null)
			{
				try
				{
					ultimateCustomerRanking2 += Decimal.valueOf(bestCustomerRanking2);
				}
				catch (Exception e)
				{
				}
			}
			if (growthOpportunityRanking != null)
			{
				try
				{
					ultimateCustomerRanking2 += Decimal.valueOf(growthOpportunityRanking2);
				}
				catch (Exception e)
				{
				}
			}

			WattylAccountGradingLookupTable__c ultimateCustomerRankingLookup = getLookupRecord('Ultimate_Customer_Ranking', ultimateCustomerRanking2);

			if (ultimateCustomerRankingLookup != null)
			{
				ultimateCustomerRanking = ultimateCustomerRankingLookup.Text_Value_1__c;
				ultimateSuggestedCallCycle = ultimateCustomerRankingLookup.Text_Value_3__c;
			}
			else
			{
				logError('Could not calculate Ultimate Customer ranking & call frequency');
			}

			acct.Ultimate_Customer_Ranking__c = ultimateCustomerRanking;
			acct.Ultimate_Suggested_Call_Cycle__c = ultimateSuggestedCallCycle;

            acct.Grade_Rank_Messages__c = String.join(errors, '\n');
        }

        update accounts;
    }

	// Utility Methods

	private Decimal getGradingValue(WattylAccountGradingLookupTable__c lookupRow, GradingType gradingType)
	{
		if (gradingType == AccountGrading.GradingType.BEST_CUSTOMER)
		{
			return lookupRow.Best_Customer_Grading__c;
		}
		else if (gradingType == AccountGrading.GradingType.CUSTOMER_GROWTH)
		{
			return lookupRow.Customer_Growth_Grading__c;
		}
		else if (gradingType == AccountGrading.GradingType.OTHER)
		{
			return lookupRow.Other_Grading__c;
		}
		else
		{
			return null;
		}
	}

	private String getGradingTypeName(GradingType gradingType)
	{		
		String typeName = null;

		if (gradingType == AccountGrading.GradingType.BEST_CUSTOMER)
		{
			typeName = 'Best Customer';
		}
		else if (gradingType == AccountGrading.GradingType.CUSTOMER_GROWTH)
		{
			typeName = 'Growth Opportunity';
		}
		else if (gradingType == AccountGrading.GradingType.OTHER)
		{
			typeName = 'Other';
		}
		else
		{
			typeName = '[Unknown Grading Type]';
		}
		
		return typeName;
	}

	private Decimal getGrading(String category, GradingType gradingType, Decimal value)
	{
		for (WattylAccountGradingLookupTable__c lookup : lookups)
		{
			if (lookup.Category__c == category && lookup.Min__c <= value && value <= lookup.Max__c)
			{
				return getGradingValue(lookup, gradingType);
			}
		}

		logError('Could not find ' + getGradingTypeName(gradingType) + ' lookup record with category=' + category + ' and min/max containing ' + value);
		return null;
	}

	private Decimal getGrading(String category, GradingType gradingType, String keyField1)
	{
		for (WattylAccountGradingLookupTable__c lookup : lookups)
		{
			if (lookup.Category__c == category && lookup.Key_Field_1__c == keyField1)
			{
				return getGradingValue(lookup, gradingType);
			}
		}

		logError('Could not find ' + getGradingTypeName(gradingType) + ' lookup record with category=' + category + ' and key field 1=' + keyField1);
		return null;
	}

	private Decimal getGrading(String category, GradingType gradingType, String keyField1, Decimal value)
	{
		for (WattylAccountGradingLookupTable__c lookup : lookups)
		{
			if (lookup.Category__c == category && lookup.Key_Field_1__c == keyField1 && lookup.Min__c <= value && value <= lookup.Max__c)
			{
				return getGradingValue(lookup, gradingType);
			}
		}

		logError('Could not find ' + getGradingTypeName(gradingType) + ' lookup record with category=' + category + ' and key field 1=' + keyField1 + ' and min/max containing ' + value);
		return null;
	}

	private WattylAccountGradingLookupTable__c getLookupRecord(String category, Decimal value)
	{
		for (WattylAccountGradingLookupTable__c lookup : lookups)
		{
			if (lookup.Category__c == category && lookup.Min__c <= value && value <= lookup.Max__c)
			{
				return lookup;
			}
		}

		logError('Could not find lookup record with category=' + category + ' and min/max containing ' + value);
		return null;
	}

	private WattylAccountGradingLookupTable__c getLookupRecord(String category)
	{
		for (WattylAccountGradingLookupTable__c lookup : lookups)
		{
			if (lookup.Category__c == category)
			{
				return lookup;
			}
		}

		logError('Could not find lookup record with category=' + category);
		return null;
	}

	private void logError(String errorMessage)
	{
		errors.add(errorMessage);
		System.debug('ERROR: ' + errorMessage);
	}

	private void addScore(GradingType gradingType, String scoreName, Decimal scoreValue)
	{
		System.debug('    ' + scoreName + ' = ' + scoreValue);

		if (gradingType == AccountGrading.GradingType.BEST_CUSTOMER)
		{
			if (scoreValue == null)
			{
				logError('Could not calculate ' + scoreName);
			}
			else
			{
				bestCustomerGrading += scoreValue;
			}
		}
		else if (gradingType == AccountGrading.GradingType.CUSTOMER_GROWTH)
		{
			if (scoreValue == null)
			{
				logError('Could not calculate ' + scoreName);
			}
			else
			{
				growthOpportunityGrading += scoreValue;
			}
		}
	}
}