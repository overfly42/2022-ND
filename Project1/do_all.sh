export ARM_SUBSCRIPTION_ID="<submission_id>"
export ARM_CLIENT_SECRET="<client_secret>"
export ARM_CLIENT_ID="<client_id>"
export ARM_TENANT_ID="<tenant_id>"
./create_image.sh
../terraform plan -out solution.plan
../terraform apply solution.plan
