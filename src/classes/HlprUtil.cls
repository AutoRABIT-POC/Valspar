public with sharing class HlprUtil {

	public static string getPeriodNumber(string period){
		string yearPart = period.substring(period.length() - 4, period.length());
		string periodPart = period.substring(0, period.indexOf('-'));
		string periodNum = periodPart.substring(periodPart.length() - 3, periodPart.length()).trim();
		if (periodNum.length() < 2){
			periodNum = '0' + periodNum;
		}
		return yearPart + periodNum;
	}
}