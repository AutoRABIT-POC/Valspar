trigger PopulateCloseDateOnOppOnLeadConverion on Lead (after update) {
	
	map<id, date> oppDateMap = new map<id, date>();
	
	for (Lead l : trigger.new){
		if (l.ConvertedDate != null && l.ConvertedOpportunityId != null && trigger.oldMap.get(l.Id).isConverted == false){
			oppDateMap.put(l.ConvertedOpportunityId, l.ConvertedDate);
		}
	}
	
	if (!oppDateMap.isEmpty()){
		HlprOpportunityFunctions.updateCloseDateOnConvertedOpp(oppDateMap);	
	}
}