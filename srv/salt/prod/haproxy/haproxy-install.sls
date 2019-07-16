include:
  - pkg.pkg-init
haproxy-install:
  file.managed:
    - name: /root/tools/haproxy-1.8.20.tar.gz.tar
    - source: salt://haproxy/files/haproxy-1.8.20.tar.gz.tar
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: tar zxf /root/tools/haproxy-1.8.20.tar.gz.tar -C /usr/local/ && cd /usr/local/haproxy-1.8.20/ && make TARGET=linux26 PREFIX=/usr/local/haproxy && make install PREFIX=/usr/local/haproxy
    - unless: test -d /usr/local/haproxy
    - require:
      - pkg: pkg-init
      - file: haproxy-install
/etc/init.d/haproxy:
  file.managed:
    - source: salt://haproxy/files/haproxy.init
    - user: root
    - group: root
    - mode: 755
    - require:
      - cmd: haproxy-install
net.ipv4.ip_nonlocal_bind:
  sysctl.present:
    - value: 1
haproxy-config-dir:
  file.directory:
    - name: /etc/haproxy
    - user: root
    - group: root
    - mode: 755
haproxy-init:
  cmd.run:
    - name: chkconfig --add haproxy
    - unless: chkconfig --list | grep haproxy
    - require:
      - file: /etc/init.d/haproxy
