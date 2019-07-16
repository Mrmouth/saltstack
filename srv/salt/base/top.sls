base:
  '*':
    - init.env_init

prod:
  'lo_node[2-3]':
    - cluster.haproxy-outside
    - cluster.haproxy-outside-keepalived
    - mariadb.mariadb-install
  'lo_node2':
    - pcre.pcre-install
    - nginx.nginx-install
    - libevent.libevent-install
    - memcached.memcached-install
    - memcached.memcached-service
