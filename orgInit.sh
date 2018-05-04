#!/bin/bash
sfdx force:org:create -f config/project-scratch-def.json -s -a ducatiCustomerExperience -d 29
sfdx force:source:push
sfdx force:user:permset:assign -n Ducati_App
sfdx force:data:tree:import -p data/importPlan.json
sfdx force:user:password:generate

sfdx shane:heroku:repo:deploy -g mshanemc -r ducati-demo-server -n shane-heroku-auto-deploy --envUser SFDC_USERNAME --envPassword SFDC_PASSWORD -t autodeployed-demos &
sfdx force:org:open