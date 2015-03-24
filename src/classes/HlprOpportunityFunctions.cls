public with sharing class HlprOpportunityFunctions {

    @future
    public static void updateCloseDateOnConvertedOpp(map<id, date> oppDateMap){
        
        list<Opportunity> oppList = new list<Opportunity>();
        
        for (Opportunity o : [SELECT Id, CloseDate FROM Opportunity WHERE Id IN :oppDateMap.keySet()]){
            o.CloseDate = oppDateMap.get(o.Id).addDays(5);
            oppList.add(o);
        }
        
        if (!oppList.isEmpty()){
            try{
                update oppList;
            }catch (system.dmlException e){
                system.debug(e.getDmlMessage(0));
            }
        }   
    }
}