**ORAN ENVIRONMENT**

This repository contains the Docker image for the oran environment.

- Requirements
    - Working on a Linux machine
    - Having Docker installed
    - Using VS Code as the code editor
    - Having the VS Code Extension “Dev Containers” from Microsoft installed

1. Clone the ORAN Dockerized environment →
[https://github.com/mmmorfa/oran-env](https://github.com/mmmorfa/oran-env)

2. From this project directory, deploy the docker environment `docker compose up -d`
3. Open a VS Code window and from the “View/Command Palette…” run the `“Dev Containers: Attach to Running Container…”` and select the `oran-env-oran` container.
4. From the VS Code environment, open a folder on the path `/home/oran`.
5. Make the desired changes on the project files, and commit the changes using git normally.
6. If any installations are made, add those installations on the `Dockerfile` of the oran-env project.

*Build commands (ToDo after first clone)*
1. `cd /home/oran/oai/cmake_targets && ./build_oai -I -w SIMU && ./build_oai -I -w SIMU --gNB --nrUE --build-e2` 
2. `cd /home/oran/flexric && mkdir build && cd build && cmake .. && make -j8 && make install`
3. `cd /home/oran/swig && ./autogen.sh && ./configure --prefix=/usr/ && make -j8 && make install`

*Run commands (Do each one on different terminals)*
1. nearRT-RIC: `cd /home/oran/flexric && ./build/examples/ric/nearRT-RIC`
2. gNB: `cd /home/oran/oai/cmake_targets/ran_build/build && ./nr-softmodem -O ../../../targets/PROJECTS/GENERIC-NR-5GC/CONF/gnb.sa.band78.fr1.106PRB.usrpb210.conf --gNBs.[0].min_rxtxtime 6 --rfsim --sa`
3. UE: `cd /home/oran/oai/cmake_targets/ran_build/build && ./nr-uesoftmodem -r 106 --numerology 1 --band 78 -C 3619200000 --rfsim --sa --uicc0.imsi 001010000000001 --rfsimulator.serveraddr 127.0.0.1`
4. xAPP: `cd /home/oran/flexric && ./build/examples/xApp/c/slice/xapp_slice_moni_ctrl`

The git project containing the ORAN project can be found on the following repo: 

[https://github.com/mmmorfa/oran](https://github.com/mmmorfa/oran)


July,2024
