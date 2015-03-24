Trigger AutoCreateIntelligenceAccount on Account (after insert) { 

 List<Account_Intelligence__c> inTel=new List<Account_Intelligence__c>();
 List<Channel_Partner_Account_Intelligence__c> CPIntel = new List<Channel_Partner_Account_Intelligence__c>();
   
  for (Account newAccount: Trigger.New){ 
   
     if (newAccount.Business_Unit__c=='Consumer Wattyl Trade')
       {
        Account_Intelligence__c intelligence= new Account_Intelligence__c();
              intelligence.Account__c=newAccount.id; 
              intelligence.Name=newAccount.name;
              intelligence.CurrencyIsoCode='AUD';
              intelligence.Number_of_Painters__c=1;
              inTel.add(intelligence);
        }
        
     if (newAccount.Business_Unit__c=='Consumer Masters')
       {
        Channel_Partner_Account_Intelligence__c intelligence= new Channel_Partner_Account_Intelligence__c();
              intelligence.Account__c=newAccount.id; 
              intelligence.Name=newAccount.name;
              intelligence.CurrencyIsoCode='AUD';
              CPIntel.add(intelligence);
        }
     }
       
    insert inTel; 
    insert CPIntel;

}