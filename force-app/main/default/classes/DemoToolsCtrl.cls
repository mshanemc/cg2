public with sharing class DemoToolsCtrl {

    @AuraEnabled
    public static void reset(){
        delete [select id from badge_earned__c where badge__r.Name = 'Winter Driver'];
    }

}
