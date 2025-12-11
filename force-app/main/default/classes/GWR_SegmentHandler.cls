public class GWR_SegmentHandler {
    public static String calculateSegment(Account acc) {
        Integer employees = acc.NumberOfEmployees != null ? acc.NumberOfEmployees : 0;
        Decimal revenue = acc.AnnualRevenue != null ? acc.AnnualRevenue : 0;
        Boolean isGrowth = acc.gwr_Growth__c == true;

        // Strategic: Large enterprises with high revenue
        if (employees >= 1000 || revenue >= 100000000) {
            return 'Strategic';
        }

        // Enterprise: Mid-size companies OR flagged as growth account
        if (isGrowth || employees >= 200 || revenue >= 10000000) {
            return 'Enterprise';
        }

        // Commercial: Everyone else
        return 'Commercial';
    }
}
