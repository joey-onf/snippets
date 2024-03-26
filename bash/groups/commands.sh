#!/bin/bash

usermod -aG mygroup "$USER"

## Refresh groups w/o re-login
newgrp mygroup
