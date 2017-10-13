public with sharing class DucatiQueries {

    @AuraEnabled
    public static list<Badge_Earned__c> getBadges(id customerId){
        return [select Badge__r.Image_Url__c, Badge__r.Name, Badge__r.Description__c, CreatedDate from Badge_Earned__c where Customer__c=:customerId order by CreatedDate DESC];
    }

    @AuraEnabled
    public static list<Customer_Bikes__c> getBikes(id customerId){
        return [select Bike__r.Image_Url__c, Bike__r.Name, Purchase_Date__c from Customer_Bikes__c where Customer__c=:customerId];
    }


}
