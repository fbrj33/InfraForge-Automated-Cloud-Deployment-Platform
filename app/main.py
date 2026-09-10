import os
import socket
from datetime import datetime, timezone

from fastapi import FastAPI

app = FastAPI(title="InfraForge Demo Application", version="1.0.0")


@app.get("/")
def root():
    return {
        "application": "InfraForge",
        "message": "Application successfully deployed!",
        "version": os.getenv("APP_VERSION", "local"),
        "environment": os.getenv("ENVIRONMENT", "local"),
        "hostname": socket.gethostname(),
        "timestamp": datetime.now(timezone.utc).isoformat(),
    }


@app.get("/health")
def health():
    return {"status": "healthy"}


@app.get("/version")
def version():
    return {
        "version": os.getenv("APP_VERSION", "local"),
        "environment": os.getenv("ENVIRONMENT", "local"),
    }
