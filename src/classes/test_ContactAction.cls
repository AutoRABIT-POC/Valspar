@isTest
private class test_ContactAction {
    
    //test before insert on Contact to insert the Account with field business unit as Consumer Consumer. Bulk Insert
    static testMethod void createAccountSuccessfulBulk(){
        //initialize var
        Contact con;
        List<Contact> conList = new List<Contact>();
        User u1 = test_ContactAction.createUser('FirstName', 'LaSTnAME', 'test482397wd942ds38@a98312ol.com', 'Consumer Contact Center Agent', 'tes92802');
        for(integer i = 0; i < 200; i++) {
            con  = test_ContactAction.createContact('firstName', 'lastName', false, 'Consumer Consumer');
            conList.add(con);
        }
        
        List<Account> accList = new List<Account>();
        System.runAs(u1){
            Test.startTest();
            insert conList;
            Test.stopTest();
            
            //query for contact
            accList = [SELECT id, Name FROM Account];
        
        }
        
        
        //assertions
        System.assertEquals(200, accList.size());
        System.assertEquals('firstName lastName', accList[0].Name);
    }
    
    //test before insert on Contact. Account already created with field business unit as Consumer Consumer
    static testMethod void createAccountNotCreated(){
        //initialize var
        Contact con = test_ContactAction.createContact('firstName', 'lastName', false, 'Consumer Consumer');
        User u1 = test_ContactAction.createUser('FirstName', 'LaSTnAME', 'test482397wd942ds38@ao47l.com', 'Consumer Contact Center Manager', 'tester');
        Account acc;
        
        System.runAs(u1){
            acc = test_ContactAction.createAccount('Test ACC', 'EPS');
            con.AccountId = acc.id;
            
            Test.startTest();
            insert con;
            Test.stopTest();
        }
        
        //query for contact
        Contact con1 = [SELECT Accountid FROM Contact WHERE id =:con.id limit 1];
        
        //assertions
        System.assertEquals(acc.id, con1.Accountid);
    }
    
    
    //test before insert on Contact. Account not created. field business unit as EPS
    static testMethod void createAccountNotCreatedEPS(){
        //initialize var
        Account acc;
        Contact con = test_ContactAction.createContact('firstName', 'lastName', false, 'EPS');
        User u1 = test_ContactAction.createUser('FirstName', 'LaSTnAME', 'test482397wd942ds38@ao47l.com', 'Consumer Contact Center Agent', 'tester');
        
        System.runAs(u1){
            //create test data
            acc = test_ContactAction.createAccount('Test Account', '');
            con.AccountId = acc.id;
            
            //run test
            Test.startTest();
            insert con;
            Test.stopTest();
        }
        
        //query for contact
        Contact con1 = [SELECT Accountid FROM Contact WHERE id =:con.id limit 1];
        
        //assertions
        System.assertEquals(acc.id, con1.Accountid);
    }

    //test before insert on Contact to overwrite last name if unknown last name field is true
    static testMethod void checkedBoxSuccessful(){
        //initialize var
        Account acc;
        Contact con = test_ContactAction.createContact('First', 'l', true, 'EPS');
        User u1 = test_ContactAction.createUser('FirstName', 'LaSTnAME', 'test482397wd942ds38@ao47l.com', 'Consumer Contact Center Manager', 'tester');
        
        SYstem.runAs(u1){
            //insert test data
            acc = test_ContactAction.createAccount('Test ACC', 'EPS');
            con.AccountId = acc.id;
            
            //run test
            Test.startTest();
            insert con;
            Test.stopTest();
        }
        
        //query for updated fields
        Contact con1 = [SELECT LastName FROM Contact WHERE id =: con.id limit 1];
        
        //assertions
        System.assertEquals(con.id, con1.id);
        System.assertEquals('Unknown', con1.lastName);
    }
    
    //test before insert on Contact to overwrite last name if unknown last name field is true and does not update the ones with unknown last name field unchecked
    static testMethod void checkedBoxBulkSuccessful(){
        //initialize var
        Account acc;
        List<Contact> insertList = new List<Contact>();
        Contact con;
        User u1 = test_ContactAction.createUser('FirstName', 'LaSTnAME', 'test482397wd942ds38@ao47l.com', 'Consumer Contact Center Manager', 'tester');
        
        System.runAs(u1){
            //insert data
             acc = test_ContactAction.createAccount('Test ACC', 'EPS');
             for(integer i = 0; i < 10; i++){
                con = test_ContactAction.createContact('First', 'l', true, 'EPS');
                con.AccountId = acc.id;
                insertList.add(con);
             }
             for(integer i = 0; i < 190; i++){
                con = test_ContactAction.createContact('First', 'l', false, 'EPS');
                con.AccountId = acc.id;
                insertList.add(con);
             }
            
            //run test
            Test.startTest();
            insert insertList;
            Test.stopTest();
        }
        
        //query results
        List<Contact> conList = [SELECT LastName FROM Contact WHERE lastName =: 'Unknown' ];
        List<Contact> conList2 = [SELECT LastName FROM Contact WHERE lastName !=: 'Unknown' ];
        
        //assertions
        System.assertEquals(10, conList.size());
        System.assertEquals(190, conList2.size());
        System.assertNotEquals('Unknown', conList2[0].LastName);
    }
    
    //test before insert on Contact. lastname blank. Missing required field
    static testMethod void failCheckedNoLast(){
        //initialize var
        Account acc;
        Contact con = test_ContactAction.createContact('First',null, false, 'EPS');
        User u1 = test_ContactAction.createUser('FirstName', 'LaSTnAME', 'test482397wd942ds38@ao47l.com', 'Consumer Contact Center Agent', 'tester');
        
        
        SYstem.runAs(u1){
            //insert test data
            acc = test_ContactAction.createAccount('Test ACC', 'EPS');
            con.AccountId = acc.id;
            
            //run test
            Test.startTest();
            try{
                System.debug('test2');
                insert con;
                SYstem.assertNotEquals(null, con.id);
                SYstem.debug('#####insert successful#####');
            } catch(DMLexception e) {
                System.debug('Entering the exception...');
                System.debug(e.getMessage());
                System.assertEquals('REQUIRED_FIELD_MISSING', e.getDmlStatusCode(0));
            }
            Test.stopTest();
        }
    }
    
    // no account attached to contact; receive validation error
    static testMethod void failNoAccount(){
        //initialize var
        Contact con = test_ContactAction.createContact('First', 'l', true, 'EPS');
        User u1 = test_ContactAction.createUser('FirstName', 'LaSTnAME', 'test482397wd942ds38@ao47l.com', 'Consumer Contact Center Agent', 'tester');
        
        //run test
        System.runAs(u1){
            try{ 
                System.debug('About to insert...');
                insert con;
            } catch (Dmlexception e) {
                System.debug('Entering the exception...');
                System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION', e.getDmlStatusCode(0));
            }
        }
    }
    
    
    //create user
    public static User createUser(String firstName, String lastName, String email, String profileName, String alias){
        
        //initialize var
        User u1 = new User();
        
        //set fields
        u1.Username = email;
        u1.alias = alias;
        u1.CommunityNickname = alias;
        u1.TimeZoneSidKey = 'America/Los_Angeles';
        u1.LocaleSidKey = 'en_US';
        u1.EmailEncodingKey = 'UTF-8';
        u1.LanguageLocaleKey = 'en_US';
        u1.firstName = firstName;
        u1.lastName = lastName;
        u1.Email = email;
        u1.ProfileId = [Select id From Profile WHere Name =: profileName limit 1].id;
        
        insert u1;
        
        return u1;
        
    }
    
    public static Contact createContact(String firstName, String lastName, boolean unknownLastName, String bu){
        //initialize var
        Contact con = new Contact();
        
        //set the fields
        con.FirstName = firstName;
        con.LastName = lastName;
        con.Unknown_Last_Name__c = unknownLastName;
        con.Business_Unit__c = bu;
        con.Email = 'none@none.com';
        
        //return con
        return con;     
    }
    
    public static Account createAccount(String name, String bu){
        //initialize var
        Account acc = new Account();
        
        //set the fields
        acc.Name = name;
        acc.Business_Unit__c = bu;
        
        //insert account
        insert acc;
        
        //return account
        return acc;
    }
}