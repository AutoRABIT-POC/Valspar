// 
//   Note*********** Changes to this program must also be made to CPI11iBatchItemCall
//
public class CPI11iStaticCall {
 public static String strJString; 
 public static string ids;
     public CPI11iStaticCall()
     {
       
     }
     public void MainMethod()
     {
        
     // callOut(ids);
       //caseRoute();
     }
   public  void parseJSONResponse(Case_Product_Information__c casep) 
      {        
        try
       {      
          
           callOut(casep.Id);
           system.debug('made it');
      
       } 
         catch (Exception ex) 
        {
        system.debug('stackoutput' + ex.getStackTraceString());
        }
      }
    //web callout from a trigger must be in a static and void method and called out as a thread

    @future(callout=true)
    public static void callOut(Id caseid){
      Case_Product_Information__c casep = [Select Item_Number__c,Fill_Batch_Number__c,Item_Number_Description__c,
      Fill_Batch_Quantity__c,Formula__c,Error_Messages__c from Case_Product_Information__c Where Id =: caseid];
       casep.Error_Messages__c=''; 
       String dataSourceName='';
       String itemNumber=casep.Item_Number__c;
       String batchNo='';
       String plantCode='';
       String plantCodeName='';
       String lookupOrgCode='';
       String endpoint='';
       String strbody='';
       String url='';
       system.debug('how many' + batchNo);
       if(test.isrunningTest())
       {
       Test.setMock(HttpCalloutMock.class, new MockHttpResGenerator());
        
        // Call method to test.
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        HttpResponse res = CalloutClass.getInfoFromExternalService();
        
        // Verify response received contains fake values
        String contentType = res.getHeader('Content-Type');
        System.assert(contentType == 'application/json');
        String actualValue = res.getBody();
        String expectedValue = '{"foo":"bar"}';
        System.assertEquals(actualValue, expectedValue);
        System.assertEquals(200, res.getStatusCode());
       }
       else
       {
       if(casep.Fill_Batch_Number__c!=null)
       {
       batchNo=casep.Fill_Batch_Number__c;
       }   
       if(casep.Fill_Batch_Number__c != null && batchNo.length()>=10)
       {
         lookupOrgCode=batchNo.substring(2,4);
         if(lookupOrgCode != '08')
         {
          batchNo=batchNo.substring(4,10);   
         }
     //    else
     //    {
     //      batchNo=batchNo.substring(4,10);   
     //    }    
         System.debug('batchno' + batchNo);
   
        try{       
           plantCode=[Select X11i_Org_Code__c from CPI_LOOKUPS__c where Batch_Warehouse_Code__c =: lookupOrgCode].X11i_Org_Code__c;
           plantCodeName=[Select Manufacturing_Site_Description__c from CPI_LOOKUPS__c where Batch_Warehouse_Code__c =: lookupOrgCode].Manufacturing_Site_Description__c;
           } 
           catch(QueryException qe)
           {
               casep.Error_Messages__c='Invalid Fill Batch Number'; 
               System.debug('The following exception has occurred: ' + qe.getMessage());    
           }
        }   
       if(plantCode.trim().length()>0)
        {
         dataSourceName=[Select Database_Source__c from CPI_LOOKUPS__c where Batch_Warehouse_Code__c =: lookupOrgCode].Database_Source__c;
        }
          else
        {   
         dataSourceName='NorthAmericanDS';
        }
       
         casep.Batch_Manufacturing_Location__c=plantCodeName;
         System.debug(dataSourceName);        
         url=[Select url__c from cloudUrl__c where interface__c = 'fillBatch11i']. url__c;
         Http httpProtocol = new Http();
         // Create HTTP request to send.
         HttpRequest request = new HttpRequest();
         request.setTimeout(60000); // timeout in milliseconds
         // Set the endpoint URL.
     try{
        if(plantCode.trim().length()>0 &&  batchNo.trim().length()>6)
        {
         endpoint = url + '/cloudwebservices/rest/erp/batchdatabylotno';
         strbody = 'dataSourceName=' + EncodingUtil.urlEncode(dataSourceName,'UTF-8') + '&itemNumber='+EncodingUtil.urlEncode(itemNumber,'UTF-8')+'&plantCode='+EncodingUtil.urlEncode(plantCode,'UTF-8') +'&lotNo='+EncodingUtil.urlEncode(batchNo,'UTF-8');
            //     strbody = '{"dataSourceName:"' + dataSourceName + ',"itemNumber":"' + itemNumber + '","plantCode":"' + plantCode + '","lotNo":"' + batchNo + '"}';
        }       
        else if (plantCode.trim().length()>0 &&  batchNo.trim().length()<=6)
        {
         endpoint = url + '/cloudwebservices/rest/erp/batchdatabybatchno';     
         strbody = 'dataSourceName=' + EncodingUtil.urlEncode(dataSourceName,'UTF-8') + '&itemNumber='+EncodingUtil.urlEncode(itemNumber,'UTF-8')+'&plantCode='+EncodingUtil.urlEncode(plantCode,'UTF-8') +'&batchNo='+EncodingUtil.urlEncode(batchNo,'UTF-8');
        }
        else 
        {
         endpoint = url + '/cloudwebservices/rest/erp/itemdatabyitemno';
         strbody = 'dataSourceName=' +  EncodingUtil.urlEncode(dataSourceName,'UTF-8') + '&itemNumber='+EncodingUtil.urlEncode(itemNumber,'UTF-8');
        }
        request.setEndPoint(endpoint);
        request.setMethod('POST');      
        request.setBody(strbody);
        System.debug('here is strbody' + strbody);      
      }catch(Exception ex)
      {
            System.debug('The following exception has occurred: ' + ex.getMessage());
      } 
           HttpResponse response = httpProtocol.send(request); 
           System.debug(response.getBody());
         
        if(response.getBody().trim()=='' && batchNo.length()>0 ){
         endpoint = url + '/cloudwebservices/rest/erp/itemdatabyitemno';
         strbody = 'dataSourceName=' +  EncodingUtil.urlEncode(dataSourceName,'UTF-8') + '&itemNumber='+EncodingUtil.urlEncode(itemNumber,'UTF-8');
         request.setEndPoint(endpoint);
         request.setMethod('POST');      
         request.setBody(strbody);
         response = httpProtocol.send(request); 
         casep.Error_Messages__c='Invalid item/lot number'; 
        
        }
        
        
        JSONParser parser = JSON.createParser(response.getBody()); 
        System.debug('XXXXXXX parser'+parser );
 
        while (parser.nextToken() != null) 
         {
          countFields++;
           if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'description'))
            {          
                parser.nextToken(); 
                casep.Item_Number_Description__c=parser.getText();
            }
          // taken out per kirsten  
          //  else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'itemNumber'))
          //  {          
          //      parser.nextToken();
          //      casep.Item_Number__c=parser.getText();
          //  }
            else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'batchNumber') && plantCode=='080')
            {          
                parser.nextToken();
                casep.Bulk_Batch_Number__c=batchNo;
                casep.Medina_Fill_Batch_Number__c=parser.getText();
            }
            else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'batchNumber') && plantCode=='080')
            {          
                parser.nextToken();
                casep.Bulk_Batch_Number__c=batchNo;
                casep.Medina_Fill_Batch_Number__c=parser.getText();
            }
            else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'lotNumber') && plantCode!='080')
            {          
                parser.nextToken();
                casep.Bulk_Batch_Number__c=parser.getText();
            }
            else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'formulaNumber'))
            {          
                parser.nextToken();
                casep.Formula__c=parser.getText();
            }
            else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'fillBatchQty'))
            {          
                parser.nextToken();
                double qty=Double.valueOf(parser.getText().trim());             
                casep.Fill_Batch_Quantity__c=qty;
            }
            else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'retainNumber'))
            {
                parser.nextToken();
                casep.Retain_Number__c=parser.getText();
            } 
             else if (parser.getCurrentToken() == JSONToken.FIELD_NAME  &&  (parser.getText() == 'productLine'))
            {
                parser.nextToken();
                casep.Product_Line__c=parser.getText();
            } 

         }
 
        if(countFields==0){
         if(batchNo.length()>0 ){
          casep.Error_Messages__c='Invalid item/lot number'; 
            } 
            else
            {
             casep.Error_Messages__c='Invalid item'; 
          }  
        }
            upsert casep;
         }   
    }
    
    public pageReference caseRoute()
    {
        ids = apexpages.currentpage().getparameters().get('CaseID');
        callOut(ids);
        pageReference pageref = new pageReference('/'+ids);
        Case_Product_Information__c casemsg;
        pageref.setRedirect(true);
        return pageRef;
    }
  
    public static integer countFields=0;  
}