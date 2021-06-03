# peepdf-docker

[Peepdf](https://github.com/jesparza/peepdf) is developed and maintained by Jose Miguel Esparza, and it's a great tool to investigate PDFs' suspicious elements. It also has an interactive console mode, with the ability to analyze JavaScript and shellcode. But, unfortunately, it is a tool that does not work smoothly on macOS and even on some Linux systems.

Some [docker](https://hub.docker.com/r/cincan/peepdf) out there already have peepdf as a container, but it does not install the `PyV8` correctly, making it hard for the Javascript analysis to work smoothly.

## Supported tags

* `latest`

## Usage

1. Pull the docker image

```$ docker pull deadlyelder/peepdf```

2. Or clone the repository and build it locally

```
$ git clone https://github.com/Deadlyelder/peepdf-docker.git
$ cd peepdf-docker
$ docker build . -t peepdf
```

### Example usages

* Analyze the file in interactive mode

`$ docker run -v /dock_vol:/samples -ti peepdf /samples/sample.pdf -i`

where the `dock_vol` is the local folder that hosts the samples to test, which will be mounted as a drive for the container, and the `samples/sample.pdf` is the file to inspect within the interactive console.

* Analyze the file directly

```bash
$ docker run -v /dock_vol:/samples peepdf /samples/sample.pdf -f
```

* Other usage

Check the official repository for what can be done with the tool. Furthermore, comments that can be used are available on the official repo [1].

## References

[1] https://github.com/jesparza/peepdf
