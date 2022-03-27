public with sharing class OpportunitySummary {
    @AuraEnabled
        public static List<Opportunity> getOpportunity() {
        return [SELECT Id, Name FROM Opportunity];

    }
}
