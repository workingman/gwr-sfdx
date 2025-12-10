trigger gwr_segment_trigger on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        acc.gwr_Customer_Segment__c = calculateSegment(acc);
    }
    // 20251209-231226
    // 20251209-232557
    // 20251209-232914
    private String calculateSegment(Account acc) {
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