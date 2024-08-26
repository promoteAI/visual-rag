import ray
import requests
from fastapi import FastAPI
from ray import serve

app = FastAPI()


@serve.deployment
@serve.ingress(app)
class FastAPIDeployment:
    @app.get("/")
    def root(self):
        return "Hello, world!"

    @app.post("/{subpath}")
    def root(self, subpath: str):
        return f"Hello from {subpath}!"


def start_main_server():
    """构建"""
    print("主服务")
    serve.run(FastAPIDeployment.bind(), route_prefix="/hello")


if __name__ == '__main__':
    start_main_server()
