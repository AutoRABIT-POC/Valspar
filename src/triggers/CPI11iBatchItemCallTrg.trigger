trigger CPI11iBatchItemCallTrg on Case_Product_Information__c (after insert,after update) {
 
    CPI11iStaticCall cp=new CPI11iStaticCall();
    for (Case_Product_Information__c casep : trigger.new) {
            cp.parseJSONResponse(casep);
     }   
   
}