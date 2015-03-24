public class blogic_ContactActions {
/********************************************************************************	
 * CLASS
 */
	
	private static String UNKNOWN_CONTACT_ACT_ON_RECORDTYPE_DEVELOPER_NAME = 'Valspar_Master_Contact_Record_Type'; //default, override by custom setting if exist
	private static String UNKNOWN_CONTACT_DEFAULT_LASTNAME_VALUE = 'Unknown'; //default, override by custom setting if exist

	private static String CREATE_CONSUMER_ACCOUNT_ACT_ON_RECORDTYPE_DEVELOPER_NAME = 'Valspar_Master_Contact_Record_Type'; //default, override by custom setting if exist
	private static String CREATE_CONSUMER_ACCOUNT_ACT_ON_BUSINESS_UNIT = 'Consumer Consumer'; //default, override by custom setting if exist
	private static String CREATE_CONSUMER_ACCOUNT_NEW_RECORDTYPE_DEVELOPER_NAME = 'Manual_Account'; //default, override by custom setting if exist
	private static String CREATE_CONSUMER_ACCOUNT_BUSINESS_UNIT_VALUE = 'Consumer Consumer'; //default, override by custom setting if exist

 
    private static Id UNKNOWN_CONTACT_ACT_ON_RECORDTYPE_ID;
    private static Id CREATE_CONSUMER_ACCOUNT_ACT_ON_RECORDTYPE_ID;
    private static Id CREATE_CONSUMER_ACCOUNT_NEW_RECORDTYPE_ID;

	static {
	/********************************************************************************	
	 * Class-level Static Code Block
	 */

	    // Obtain the Settings from a Custom Settings Object
    	List<Service_Cloud_Settings__c> settings = Service_Cloud_Settings__c.getAll().values();
    	for (Service_Cloud_Settings__c setting : settings) {
      		if (Setting.Name == 'Unknown Contact - Act On RecordType') UNKNOWN_CONTACT_ACT_ON_RECORDTYPE_DEVELOPER_NAME = Setting.Value__c;          
      		if (Setting.Name == 'Unknown Contact - LastName Default') UNKNOWN_CONTACT_DEFAULT_LASTNAME_VALUE = Setting.Value__c;          
      		if (Setting.Name == 'Create Account - Act On RecordType') CREATE_CONSUMER_ACCOUNT_ACT_ON_RECORDTYPE_DEVELOPER_NAME = Setting.Value__c;          
      		if (Setting.Name == 'Create Account - Act On Business Unit') CREATE_CONSUMER_ACCOUNT_ACT_ON_BUSINESS_UNIT = Setting.Value__c;          
      		if (Setting.Name == 'Create Account - New RecordType Name') CREATE_CONSUMER_ACCOUNT_NEW_RECORDTYPE_DEVELOPER_NAME = Setting.Value__c;          
      		if (Setting.Name == 'Create Account - Business Unit Default') CREATE_CONSUMER_ACCOUNT_BUSINESS_UNIT_VALUE = Setting.Value__c;          
    	}
    	
    	//could be optimized to one query
    	UNKNOWN_CONTACT_ACT_ON_RECORDTYPE_ID = [SELECT Id FROM RecordType WHERE DeveloperName = :UNKNOWN_CONTACT_ACT_ON_RECORDTYPE_DEVELOPER_NAME LIMIT 1][0].Id;
    	CREATE_CONSUMER_ACCOUNT_ACT_ON_RECORDTYPE_ID = [SELECT Id FROM RecordType WHERE DeveloperName = :CREATE_CONSUMER_ACCOUNT_ACT_ON_RECORDTYPE_DEVELOPER_NAME LIMIT 1][0].Id;
    	CREATE_CONSUMER_ACCOUNT_NEW_RECORDTYPE_ID = [SELECT Id FROM RecordType WHERE DeveloperName = :CREATE_CONSUMER_ACCOUNT_NEW_RECORDTYPE_DEVELOPER_NAME LIMIT 1][0].Id;

	} //End Static Code Block	



	public static void PopulateLastNameOnUnknown (List<Contact> newContacts) {
	/********************************************************************************	
	 * METHOD: PopulateLastNameOnUnknown (to be called from CONTACT BEFORE INSERT)
	 */

		//Traverse all new Contact in Trigger context
		for (Contact c : newContacts) {
			if (c.Unknown_Last_Name__c == true /* && c.RecordTypeId == UNKNOWN_CONTACT_ACT_ON_RECORDTYPE_ID */ ) {
				c.LastName = UNKNOWN_CONTACT_DEFAULT_LASTNAME_VALUE; //business rule says to overwrite regardless of value
			}
		} 	
		
	} //End PopulateLastNameOnUnknown Method

	public static void CreateConsumerAccount (List<Contact> newContacts) {
	/********************************************************************************	
	 * METHOD: CreateConsumerAccount (to be called from CONTACT BEFORE INSERT)
	 */

		List<Account> accountsToAdd = new List<Account>();
		List<Contact> contactsToUpdate = new List<Contact>();

		//Traverse all new Contact in Trigger context
		for (Contact c : newContacts) {
			if (c.Business_Unit__c == CREATE_CONSUMER_ACCOUNT_ACT_ON_BUSINESS_UNIT &&
			    c.AccountId == null /* && c.RecordTypeId == CREATE_CONSUMER_ACCOUNT_ACT_ON_RECORDTYPE_ID */ ) {
				Account newConsumerAccount = new Account(RecordTypeId=CREATE_CONSUMER_ACCOUNT_NEW_RECORDTYPE_ID,
														 Name=(((c.FirstName != null) ? c.FirstName + ' ' : '') + c.LastName).trim(),
														 Business_Unit__c=CREATE_CONSUMER_ACCOUNT_BUSINESS_UNIT_VALUE);
				accountsToAdd.add(newConsumerAccount);
				contactsToUpdate.add(c);
			}
		} 	
		
		insert accountsToAdd; //to do, add pretty exception handling
		
		//update related contacts with AccountId
		Integer i = 0;
		for (Contact c : contactsToUpdate) {
			c.AccountId = accountsToAdd[i].Id;
			i++;
		}
		
	} //End CreateConsumerAccount Method


} //End blogic_ContactActions Class