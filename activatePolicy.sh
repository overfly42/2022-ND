#activatePloly.sh <subscription-id>
az policy assignment create --name 'tagging-policy' --scope /subscriptions/$1/resourceGroups/udacity-demo-rg --policy /subscriptions/$1/providers/Microsoft.Authorization/policyDefinitions/tagging-policy
