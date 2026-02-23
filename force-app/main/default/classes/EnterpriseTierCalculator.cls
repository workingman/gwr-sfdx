public class EnterpriseTierCalculator {

    public static void calculateTier(List<Account> accounts) {
        for (Account acc : accounts) {
            String segment = acc.gwr_Customer_Segment__c;
            String sla = acc.SLA__c;
            String serial = acc.SLASerialNumber__c;
            String health = acc.gwr_Customer_Health__c;
        }
    }
}
