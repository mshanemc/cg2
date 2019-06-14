#!/bin/bash
sfdx force:org:create -f config/project-scratch-def.json -s -a ducatiCustomerExperience -d 29
sfdx force:source:push
sfdx force:user:permset:assign -n Ducati_App
sfdx force:data:tree:import -p data/importPlan.json
sfdx force:user:password:generate

sfdx force:org:open

# create the app from app.json
sfdx shane:heroku:repo:deploy -g mshanemc -r ducati-demo-server -n `basename "${PWD/mshanemc-/}"` --envuser SFDC_USERNAME --envpassword SFDC_PASSWORD -t autodeployed-demos
heroku pipelines:create `basename "${PWD/mshanemc-/}"` -a `basename "${PWD/mshanemc-/}"` --stage production --team autodeployed-demos
sfdx shane:heroku:repo:deploy -g mshanemc -r ducati-demo-server -n `basename "${PWD/mshanemc-/}"`-stg --envuser SFDC_USERNAME --envpassword SFDC_PASSWORD -t autodeployed-demos
heroku pipelines:add `basename "${PWD/mshanemc-/}"` -a `basename "${PWD/mshanemc-/}"`-stg --stage staging
heroku pipelines:connect `basename "${PWD/mshanemc-/}"` --repo mshanemc/ducati-demo-server
heroku access:add platformpmmdemos@gmail.com -a `basename "${PWD/mshanemc-/}"` --permissions=deploy,operate,manage
heroku access:add platformpmmdemos@gmail.com -a `basename "${PWD/mshanemc-/}"`-stg --permissions=deploy,operate,manage
sfdx shane:heroku:connect -a `basename "${PWD/mshanemc-/}"` -f mappings.json -e custom