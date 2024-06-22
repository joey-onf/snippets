#!/bin/bash

gpg2 --fingerprint \
    | grep 'Key fingerprint' \
    | tr --delete '[[:blank:]]' \
    | sed -e 's/Keyfingerprint=/Key fingerprint = /'
