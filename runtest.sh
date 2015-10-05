#!/bin/bash

# this is what starts an interactive shell within your container
docker run -ti --rm --volumes-from "openerp.base.kings" docker/openerpbase-kings /bin/bash
