#!/usr/bin/env python3


import sys

from datetime import datetime

#===============================================================================

class Context:

    authenticated = None
    today         = None

    #----------------------------------------------------------------------

    def __init__(self, title, authenticated=False):

        self.title         = title
        self.menu          = title

        self.now           = datetime.now()
        self.today         = self.now.strftime("%Y-%m-%d")
        self.year          = self.now.strftime("%Y")

        self.authenticated = False
        self.profile       = {}
        self.email         = None

    #----------------------------------------------------------------------

#===============================================================================

