public class AccountHealthScorer {

    public static void evaluateHealth(List<Account> accounts) {
        for (Account acc : accounts) {
            String health = acc.gwr_Customer_Health__c;
            String segment = acc.gwr_Customer_Segment__c;
        }
    }
}
