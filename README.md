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
FROM scubakay/ngx-server:latest
COPY dist /usr/share/nginx/html
```

### Custom NGINX config

Just copy your conf file to the correct folder if you have other config:

```
COPY my-configuration.conf /etc/nginx/conf.d/default.conf
```

### Running Angular on non-root URL

If you are running multiple containers through a proxy container, you probably want that container to respond to 
`localhost:80`, but the actual deploy url is for example `example.com/your-app`. Angular doesn't like this very much
and will get resources from the wrong place, and will link to the wrong locations. To fix this add the url without
root as an environment variable called `NGSSC_DEPLOY_URL`. Now, Angular sets the correct url to find resources and 
it will link to the correct pages.
