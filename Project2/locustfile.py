#Load test with locust
from locust import HttpUser, task, between

class TestUser(HttpUser):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.data={
            'CHAS': {
                '0': 0,
            },
            'RM': {
                '0': 6.575,
            },
            'TAX': {
                '0': 296.0,
            },
            'PTRATIO': {
                '0': 15.3,
            },
            'B': {
                '0': 396.9,
            },
            'LSTAT': {
                '0': 4.98,
            }
        }
    @task
    def get_prediction(self):
        self.client.post('/predict',json=self.data)
        
