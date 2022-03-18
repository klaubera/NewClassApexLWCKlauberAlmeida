public with sharing class CarsController {

    @AuraEnabled(cacheable=true)
    public static List<Name> getContactCars(Id contactId) {
        return [SELECT Model__c, Air_Conditioner__c, Type__c
        FROM Vehicle__c
        WHERE OwnerId =: contactId];

    }
    
}
