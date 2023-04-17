# Treollo Board
URL: https://trello.com/b/R6aZ3kbq/udacity2022devopsprj2
#Git Config
1. Create a new pair of ssh Keys with: ssh-keygen
2. Insert public key (\*.pub) into github / settings / ssh keys
3. add config file ssh.config as config to ~/.ssh/
4. Execute git clone

# Load Test
Result of localhost in json format: /locust.result
How to execute for 100 users / for 10 seconds:
locust --host http://localhost:5000 -f locustfile.py --users 100 --run-time 10 --headless --json


