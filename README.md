### Requirements
```bash
brew install orbstack
brew install --cask xquartz
```

### Setup
```bash
xhost +local:docker
export DISPLAY=host.docker.internal:0
```

### Usage
```bash
# Building the image
docker build . -t armsim

# Start a temporary container
docker run -it --rm --network host -e DISPLAY=$DISPLAY -v "absolute_host_path":/tmp armsim
```

