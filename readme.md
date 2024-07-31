**ORAN ENVIRONMENT**

This repository contains the Docker image for the oran environment.

- Requirements
    - Working on a Linux machine
    - Having Docker installed
    - Using VS Code as the code editor
    - Have the VS Code Extension “Dev Containers” from Microsoft installed

1. Clone the ORAN Dockerized environment →

[https://github.com/mmmorfa/oran-env](https://github.com/mmmorfa/oran-env)

1. From this project directory, deploy the docker environment `docker compose up`
2. Open a VS Code window and from the “View/Command Palette…” run the `“Dev Containers: Attach to Running Container…”` and select the `oran-env-oran` container.
3. From the VS Code environment, open a folder on the path `/home/oran`.
4. Make the desired changes on the project files, and commit the changes using git normally.
5. If any installations are made, add those installations on the `Dockerfile` of the oran-env project.

The git project containing the ORAN project can be found on the following repo: 

[https://github.com/mmmorfa/oran](https://github.com/mmmorfa/oran)


July,2024