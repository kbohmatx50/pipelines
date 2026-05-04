"""
Renders pipeline.jinja.yml using values from config.yml
Outputs: pipeline.yml (the final CloudFormation template)
"""

import yaml
from jinja2 import Environment, FileSystemLoader

with open("config.yml", "r") as f:
    config = yaml.safe_load(f)

env = Environment(loader=FileSystemLoader("."))
template = env.get_template("pipeline.jinja.yml")
rendered = template.render(**config)

with open("pipeline.yml", "w") as f:
    f.write(rendered)

print("? pipeline.yml rendered successfully")