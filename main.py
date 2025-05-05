# main.py

from fastapi import FastAPI, Request
from pydantic import BaseModel
from typing import Dict

app = FastAPI()

class PatenteRequest(BaseModel):
    patente: str

@app.post("/consultar")
def consultar_patente(data: PatenteRequest) -> Dict:
    # Más adelante acá pondremos el código con Selenium
    patente = data.patente.upper()

    # Simulación de respuesta
    return {
        "marca": "PEUGEOT",
        "modelo": "208 ACTIVE",
        "tipo": "AUTOMOVIL",
        "anio_origen": "2021 / NACIONAL",
        "patente": patente
    }
