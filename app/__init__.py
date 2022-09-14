#!/usr/bin/env python3
#
# -----------------------------------------------------------------------------
"""
  Setup module for FastAPI application

"""
# -----------------------------------------------------------------------------

import os
import uuid
import logging

from fastapi import FastAPI

from fastapi.templating import Jinja2Templates

# -----------------------------------------------------------------------------

from .CONFIG import (
    LogName,
    Title,
    Version
)

# -----------------------------------------------------------------------------

UUID      = os.getenv('UUID', default=uuid.uuid4())
HOST      = os.getenv('HOST', default='127.0.0.1')

# -----------------------------------------------------------------------------

log       = logging.getLogger(f"{LogName}")

templates = Jinja2Templates(directory="app/templates")

app       = FastAPI(title=Title, version=Version)

# -----------------------------------------------------------------------------

