sfdx shane:org:delete

heroku destroy -a `basename "${PWD}"` -c `basename "${PWD}"`
heroku destroy -a `basename "${PWD}"`-stg -c `basename "${PWD}"`-stg