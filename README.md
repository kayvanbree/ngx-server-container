# ngx-server

`ngx-server` is a container that let's you serve an Angular application through NGINX, with the 
possibility to use the container's environment variables.

## Usage

First of all, follow the [ngssc docs](https://github.com/kyubisation/angular-server-side-configuration) to prepare your Angular application.
In short, this is what you need to do:

1. `ng add angular-server-side-configuration`
1. Add env vars to `environment.prod.ts`
1. Add `<!-- CONFIG -->` to your head tag in index.html
1. Build using ngssc: `run estimation-planning:ngsscbuild:production`

### Minimal Dockerfile

```
FROM ngx-server
COPY dist /usr/share/nginx/html
```

### Custom NGINX config

Just copy your conf file to the correct folder:

```
COPY my-configuration.conf /etc/nginx/conf.d/default.conf
```

### Running Angular on non-root URL

TODO: Add something here
