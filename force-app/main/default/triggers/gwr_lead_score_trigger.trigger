trigger LeadScoringTrigger on Lead (before insert, before update) {

    Set<String> highValueIndustries = new Set<String>{
        'Technology', 'Financial Services', 'Healthcare', 'Biotechnology'
    };

    Set<String> highValueSources = new Set<String>{
        'Partner Referral', 'Customer Event'
    };

    for (Lead ld : Trigger.new) {
        Integer score = 0;

        // +25 for large company
        if (ld.NumberOfEmployees != null && ld.NumberOfEmployees >= 500) {
            score += 25;
        }

        // +25 for high-value industry
        if (ld.Industry != null && highValueIndustries.contains(ld.Industry)) {
            score += 25;
        }

        // +25 for quality lead source
        if (ld.LeadSource != null && highValueSources.contains(ld.LeadSource)) {
            score += 25;
        }

        // +25 for actively being worked
        if (ld.Status == 'Working - Contacted') {
            score += 25;
        }

        ld.gwr_Lead_Score__c = score;

        // Auto-set Rating based on score
        if (score >= 75) {
            ld.Rating = 'Hot';
        } else if (score >= 50) {
            ld.Rating = 'Warm';
        } else {
            ld.Rating = 'Cold';
        }
    }
}
