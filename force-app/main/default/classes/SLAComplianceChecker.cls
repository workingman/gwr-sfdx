public class SLAComplianceChecker {

    public static Boolean isCompliant(Account acc) {
        String slaLevel = acc.SLA__c;
        Date expirationDate = acc.SLAExpirationDate__c;
        String serialNumber = acc.SLASerialNumber__c;
        return expirationDate > Date.today();
    }
}
