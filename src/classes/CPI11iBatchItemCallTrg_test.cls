@istest(seeAlldata=true)
public class CPI11iBatchItemCallTrg_test{
public static testmethod void testCPI11iBatchItemCallTrg()
{
case c=new case(subject='test case',Channel__c='Ace',   Brand__c='valspar',type='product');
insert c;
Case_Product_Information__c cp=new  Case_Product_Information__c(Case__c=c.id,   Item_Number__c='123456789123456');
insert cp;
cp.Item_Number__c='123456789123457';
update cp;
}
}