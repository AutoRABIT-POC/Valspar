@istest
private  class TestCompIntel
{

static testMethod void myTest() 
{

Account testAccount = new Account(Name = 'TestAccount');
insert testAccount;

    Integer count1 = [SELECT count() from FeedItem];    
    
Competitive_Intelligence__c cc = new Competitive_Intelligence__c ();
cc.Market_End_Use__c = 'Bev Can 2PC';
cc.Topic__c = 'test topic';
cc.Detail__c = 'test Detail';
insert cc;
 
Competitive_Intelligence__c cc2 = new Competitive_Intelligence__c ();
cc2.Account_Name__c = testAccount.ID ; 
cc2.Market_End_Use__c = 'Bev Can 2PC';
cc2.Topic__c = 'test topic';
cc2.Detail__c = 'test Detail';
cc2.Competitor__c = 'Other'; // NARMIN //
cc2.Business_Segment__c = 'Bev Can'; // NARMIN //
cc2.Global_Region__c = 'All'; // NARMIN //
cc2.Activity_Category__c = 'Other'; // NARMIN //
insert cc2;    
    
    Integer count2 = [SELECT count() from FeedItem]; 

FeedItem f = new FeedItem(); 

f.ParentId = '0F9E00000008cyZ'; // NARMIN changed id to one from production //
f.Body = 'New competitive intel has been added for';
insert f; 

    System.Assert(count2 - 2 == count1);
    
}

}