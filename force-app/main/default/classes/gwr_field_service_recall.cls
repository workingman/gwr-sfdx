public class gwr_field_service_recall {

private String calculateSegment(Account acc) {
        Integer employees = acc.NumberOfEmployees != null ? acc.NumberOfEmployees : 0;
        Decimal revenue = acc.AnnualRevenue != null ? acc.AnnualRevenue : 0;
        Boolean isGrowth = acc.gwr_Growth__c == true;

        // Strategic: Large enterprises with high revenue
        if (employees >= 10000 || revenue >= 30000000) {
            return 'Strategic';
        }

        // Enterprise: Mid-size companies OR flagged as growth account
        if (isGrowth || employees >= 2000 || revenue >= 1000000) {
            return 'Enterprise';
        }

        // Commercial: Everyone else
        return 'Commercial';
    }

// 20251209-23302200
// 20251210-23244820

}