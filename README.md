# workspace-cleanup-action
Cleans the workspace

# Usage

## Cleaning up whole workspace
:NOTE: It should be run at the end of the workflow only
```yaml
name: Cleaningup with Workspace

on:
  push:
    branches:
      - master
      - main
jobs:
  build:
    runs-on: onprem-linux
    steps:
      - name: Cleaning up workspace
        uses: AADependencies/workspace-cleanup-action@v1
```
## Deleting specific directory
```yaml
name: Cleaningup with Workspace

on:
  push:
    branches:
      - master
      - main
jobs:
  build:
    runs-on: onprem-linux
    steps:
      - name: Cleaning up workspace
        uses: AADependencies/workspace-cleanup-action@v1
        with:
          directory: "Dusty"
```


