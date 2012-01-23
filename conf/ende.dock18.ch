upstream base_lady_comp_com {
        # server unix:/tmp/gunicorn.sock fail_timeout=0;
        # For a TCP configuration:
        server localhost:8002 fail_timeout=0;
}

# throttle


server {
        listen   80;
        server_name ende.dock18.ch.node05.daj.anorg.net, ende.dock18.ch;


    proxy_redirect     off;
    proxy_set_header   Host             $host;
    proxy_set_header   X-Real-IP        $remote_addr;
    proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;

    proxy_cache webcache;
    proxy_cache_key $scheme$host$request_uri;
    proxy_cache_valid  200 301 302 304 120m;
    proxy_cache_valid  any 1m;


        location /static  {
                autoindex  on;
                root /var/www/ende.dock18.ch/src/website/;
        }

        location /media  {
                autoindex  on;
                root /var/www/ende.dock18.ch/src/website/;
        }


        # path for static files
        root /var/www/ende.dock18.ch/src/website/static;
        location / {

                proxy_redirect off;

                #limit_req   zone=base  burst=40;
                proxy_pass   http://base_lady_comp_com;

        }


}