public class MockedCalculatedInsightsCT {
    @AuraEnabled(cacheable=true)
    public static List<Mocked_Calculated_Insight__c> getInsights() {
        return [SELECT Id, Icon_Name__c, Name, Order__c, Value__c FROM Mocked_Calculated_Insight__c];
    }
}