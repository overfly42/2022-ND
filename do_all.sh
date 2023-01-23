./set_creds.sh
./create_image.sh
../terraform plan -out solution.plan
../terraform apply solution.plan
