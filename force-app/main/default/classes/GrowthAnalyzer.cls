public class GrowthAnalyzer {

    public static String analyzeGrowthPotential(Account acc) {
        Decimal growth = acc.gwr_Growth__c;
        String segment = acc.gwr_Customer_Segment__c;
        return 'Analyzed';
    }
}
