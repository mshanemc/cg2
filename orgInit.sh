#!/bin/bash
sfdx force:org:create -f config/project-scratch-def.json -s -a ducatiCustomerExperience -d 29
sfdx force:source:push
sfdx force:user:permset:assign -n Ducati_App
sfdx force:data:tree:import -p data/importPlan.json
sfdx force:user:password:generate
sfdx force:org:open