install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_hello.py
	python flask-sklearn/app.py &
	locust --host http://localhost:5000 -f locustfile.py --users 100 --run-time 10 --headless --json

lint:
	pylint --disable=R,C hello.py

all: install lint test
