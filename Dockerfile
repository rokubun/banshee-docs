FROM squidfunk/mkdocs-material as devel

WORKDIR /docs

COPY requirements.txt .

RUN pip install --upgrade pip \
 && pip install --requirement requirements.txt


FROM devel as build

COPY . .
RUN mkdocs build


FROM nginx:alpine
COPY --from=build /docs/site /usr/share/nginx/html

