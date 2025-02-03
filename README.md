ollama-local-setup
==================

Simple setup for running ollama locally via podman leveraging your nvidia GPU.

### Pod setup:

- create:
  - `task create` or `./bin/create.sh`
- remove:
  - `task remove` or `./bin/remove.sh`
  - `task remove-volumes` or `./bin/remove-volumes.sh`

I had trouble getting podman to pickup the GPU using compose or K8s yaml hence the shell scripts

### Port mappings:

- Ollama: 11434 (standard port)
- Open Webui: [8909](http://localhost:8909)
  - Something different to not conflict with other dev apps, etc. 

### Assumptions:

- Config files setup to work with podman
- You have an Nvidia gpu with nvidia container toolkit all setup. [docs](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/cdi-support.html)
### Warnings:

- this is running the containers with SEL Labelling disabled to access the GPU without any issues..

### QOL Additions

- This leverages go-task to run the podman commmands, but you can just copy the commands right out of the taskfile
- [Docs](https://taskfile.dev/) & [installation instructions](https://taskfile.dev/installation/)

#### Tasks:
- create: start local ollama containers
- remove: remove the ollama-local pod
- ollama-tty: ollama terminal

For quick access to ollama I also added this to my shell config `alias ollama-term='podman exec -it ollama /bin/bash'`
