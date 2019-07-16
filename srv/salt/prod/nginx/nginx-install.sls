include:
  - pkg.pkg-init
nginx-install:
  file.managed:
    - name: /root/tools/nginx-1.14.2.tar.gz
    - source: salt://nginx/files/nginx-1.14.2.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: tar -zxf /root/tools/nginx-1.14.2.tar.gz -C /usr/local && cd /usr/local/nginx-1.14.2 && ./configure --prefix=/usr/local/nginx --with-http_stub_status_module && make && make install && cd /usr/local/nginx/sbin/ && ./nginx
    - unless: test -d /usr/local/nginx

/usr/local/nginx/conf/nginx.conf:
  file.managed:
    - name: /usr/local/nginx/conf/nginx.conf
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 644
