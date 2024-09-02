#!/usr/bin/env python3
#
#
#
# -----------------------------------------------------------------------------
"""
    Main component of app
"""
# -----------------------------------------------------------------------------

from typing import Union
from fastapi import Request
from datetime import datetime

# -----------------------------------------------------------------------------

from . import app, log, templates
from .context import Context

# =============================================================================
# Web/HTML Endpoints
# -----------------------------------------------------------------------------

@app.get("/")
async def home(request: Request):
    ctx = Context("Home")
    return templates.TemplateResponse("home_v02.html", {"request": request, "ctx": ctx})

# -----------------------------------------------------------------------------

@app.get("/home")
async def home(request: Request):
    ctx = Context("Home")
    return templates.TemplateResponse("home_v02.html", {"request": request, "ctx": ctx})

# -----------------------------------------------------------------------------

@app.get("/projects")
async def projects(request: Request):
    ctx = Context("Projects")
    return templates.TemplateResponse("_list/projects.html", {"request": request, "ctx": ctx})

# -----------------------------------------------------------------------------

@app.get("/about")
async def about(request: Request):
    ctx = Context("About")
    return templates.TemplateResponse("about_v02.html", {"request": request, "ctx": ctx})

# -----------------------------------------------------------------------------

@app.get("/contact-us")
async def contact_us(request: Request):
    ctx = Context("About")
    return templates.TemplateResponse("contact_us.html", {"request": request, "ctx": ctx})

# -----------------------------------------------------------------------------

@app.post("/contact-us")
async def contact_us(request: Request):
    ctx = Context("Home")
    return templates.TemplateResponse("home_v02.html", {"request": request, "ctx": ctx})

# -----------------------------------------------------------------------------

@app.get("/not-implemented-yet")
async def not_implemented_yet(request: Request):
    ctx = Context("About")
    log.info("Into about")
    return templates.TemplateResponse("not_implemented_yet.html", {"request": request, "ctx": ctx})

# =============================================================================
# These return JSON
# -----------------------------------------------------------------------------

@app.get("/hello")
def read_root():
    return {"Hello": "World"}

# -----------------------------------------------------------------------------

@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

# -----------------------------------------------------------------------------

