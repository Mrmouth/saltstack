include:
  - memcached.memcached-install
memcached-service:
  cmd.run:
    - name: /usr/local/memcached/bin/memcached -d -m 128 -p 11211 -c 8096 -u root
    - unless: netstat -lntup | grep 11211
    - require:
      - cmd: memcached-install
