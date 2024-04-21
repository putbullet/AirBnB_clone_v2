#!/usr/bin/python
""" holds class City"""
from models.base_model import BaseModel, Base
from sqlalchemy import Column, String
from sqlalchemy.orm import relationship
from os import environ

class User(BaseModel, Base):
    """Representation of a user """
    __tablename__ = 'users'

    email = Column(String(128), nullable=False)
    password = Column(String(128), nullable=False)
    first_name = Column(String(128))
    last_name = Column(String(128))

    if environ.get("HBNB_TYPE_STORAGE") == 'db':
        places = relationship("Place", backref="user")
        reviews = relationship("Review", backref="user")
