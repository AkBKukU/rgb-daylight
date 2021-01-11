#!/usr/bin/python3
import json
from os import path

class Config(object):
    """Config loading class for saving and loading settings json for programs

    Dynamically creates json file as values are initially requested
    """

    def __init__(self,json_path=None):
        """Init with file path"""

        self.json_path = None

        if json_path is not None:
            self.json_path = json_path
            self.load()


    def save(self, file_path=None):
        """Save all settings data to JSON file with indents"""
        if file_path is None:
            file_path = self.json_path

        with open(file_path, 'w') as f:
            json.dump(self.data, f, sort_keys=True, indent=4)


    def load(self, file_path=None):
        """Read data from JSON file and create file if non existent"""
        if file_path is None:
            file_path = self.json_path

        if not path.exists(file_path):
            with open(file_path, 'a') as newfile:
                newfile.write("{}")

        with open(file_path, 'r') as f:
            self.data = json.load(f)


    def set(self,key, value):
        """Set a given setting and save the json"""
        self.data[key] = value
        self.save()


    def get(self,key, default):
        """Request a given setting and create it with default if non-existent"""
        if key in self.data:
            return self.data[key]
        else:
            self.data[key] = default
            self.save()
            return default

