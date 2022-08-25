# Template for MkDocs documentation

Use this template when you wish to setup a documentation project based on mkdocs

To build a Docker image to develop the documentation

```bash
image_name="mkdocs_dev"
docker build -t ${image_name} --target devel .
```

```bash
docker run -v `pwd`:/docs -p 8000:8000 -ti ${image_name} bash
```

Within the container

```bash
cd /docs
mkdocs serve -a 0.0.0.0:8000
```

You can preview the documentation in [this address](http://localhost:8000)
