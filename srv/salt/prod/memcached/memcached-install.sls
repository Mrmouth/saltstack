include:
  - pkg.pkg-init
  - libevent.libevent-install
memcached-install:
  file.managed:
    - name: /root/tools/memcached-1.4.24.tar.gz
    - source: salt://memcached/files/memcached-1.4.24.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: tar -zxf /root/tools/memcached-1.4.24.tar.gz -C /usr/local/ && cd /usr/local/memcached-1.4.24 && ./configure --prefix=/usr/local/memcached --with-libevent=/usr/local/libevent && make && make install
    - unless: test -d /usr/local/memcached
    - require:
      - cmd: libevent-install
      - file: memcached-install
