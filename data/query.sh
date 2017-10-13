#!/bin/bash

# delete whatever data files you had
rm Bike__c.json
rm Contact.json
rm Ducati_Badge__c.json
rm Badge_Earned__c.json
rm Customer_Bikes__c.json
rm Ride__c.json


#query contacts
sfdx force:data:tree:export -q "select firstname, lastname, email, mobilephone, birthdate from contact"

#bikes
sfdx force:data:tree:export -q "select name, image_url__c from Bike__c"

#query badges
sfdx force:data:tree:export -q "select name, image_url__c, description__c from Ducati_Badge__c"

#earned badges
sfdx force:data:tree:export -q "select Badge__c, Customer__c from Badge_Earned__c"

#customer bikes
sfdx force:data:tree:export -q "select Bike__c, Customer__c, Purchase_Date__c from Customer_Bikes__c"

#rides
sfdx force:data:tree:export -q "select Bike__c, Customer__c, Distance__c, End__c, Start__c, Weather__c from Ride__c"

