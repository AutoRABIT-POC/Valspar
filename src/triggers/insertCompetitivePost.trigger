trigger insertCompetitivePost on Competitive_Intelligence__c (after insert) {
   
    List<FeedItem> feedItemList = new List<FeedItem>();
    for(Competitive_Intelligence__c ce : Trigger.new){
     
        FeedItem f = new FeedItem();
        Datetime newDate = ce.CreatedDate;
     
     Account comp =new Account();
     String bodyStr=''; 
      try{ 
       comp = [SELECT Name FROM Account WHERE Name =: ce.Competitor__c Limit 1];
       }catch( QueryException c)
       {
       
       } 
        
      if([SELECT count() FROM Account WHERE ID =: ce.Account_Name__c]>0) {
       Account acc = [SELECT Name FROM Account WHERE ID =: ce.Account_Name__c ];
      
     
     //   Competitive_Intelligence__C complink = [SELECT name from Competitive_Intelligence__C]; 
                
        f.ParentId = '0F9E00000008cyZ';
        bodyStr =  'New competitive intel has been added for' 
         + '\n Account: '+  acc.Name   +'\n Competitor: ' + comp.Name 
         + '\n Region: ' + ce.Global_Region__c 
         + '\n Business Segment: ' + ce.Business_Segment__c 
         + '\n Activity/Category: ' + ce.Activity_Category__c; 
     
         if(ce.Market_End_Use__c !=null && ce.Market_End_Use__c.length()>0){
            bodyStr+= '\n Market/End Use: ' + ce.Market_End_Use__c; 
         }
     
         if(ce.Topic__c !=null && ce.Topic__c.length()>0){
            bodyStr+= '\n Topic: ' + ce.Topic__c; 
         }
         
         if(ce.Detail__c !=null && ce.Detail__c.length()>0){
           bodyStr+= '\n Detail: ' + ce.Detail__c; 
         }
     
       if(bodyStr.length()>1000){
         bodyStr=bodyStr.substring(0,999);
       }
            
         f.body=bodyStr;
        
        //insert f;
          feedItemList.add(f);
       }
    else{  
       f.ParentId = '0F9E00000008cyZ';
       bodyStr =  'New competitive intel has been added for'  + '\n'+  ' Competitor: ' + comp.Name
         + '\n Region: ' + ce.Global_Region__c 
         + '\n Business Segment: ' + ce.Business_Segment__c 
         + '\n Activity/Category: ' + ce.Activity_Category__c; 

         if(ce.Market_End_Use__c !=null && ce.Market_End_Use__c.length()>0){
            bodyStr+= '\n Market/End Use: ' + ce.Market_End_Use__c; 
         }
     
         if(ce.Topic__c !=null && ce.Topic__c.length()>0){
            bodyStr+= '\n Topic: ' + ce.Topic__c; 
         }
         
         if(ce.Detail__c !=null && ce.Detail__c.length()>0){
          bodyStr+= '\n Detail: ' + ce.Detail__c; 
         }
     
        if(bodyStr.length()>1000){
         bodyStr=bodyStr.substring(0,999);
       }
     
      f.body=bodyStr;
      //insert f;
        feedItemList.add(f);
     }
    }
    insert feedItemList;
}