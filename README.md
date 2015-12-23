mockmoon
=====
> A simple lua extension based on openresty. I can mock specific file to specific url.

## Usage:

```nginx
server {
     listen 80;
     server_name example.com;
     rewrite_log on;
     location / {
        set $configFile your-config-file.json;
        rewrite_by_lua_file path-to-file.lua;
        proxy_pass http://backend;
     }
}
```