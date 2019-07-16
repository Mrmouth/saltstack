include:
  - pkg.pkg-init
keepalived-install:
  file.managed:
    - name: /root/tools/keepalived-2.0.10.tar.gz
    - source: salt://keepalived/files/keepalived-2.0.10.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: tar zxf /root/tools/keepalived-2.0.10.tar.gz -C /usr/local/src/ && cd /usr/local/src/keepalived-2.0.10/ && ./configure && make && make install
    - unless: test -d /usr/local/src/keepalived-2.0.10
    - require:
      - file: keepalived-install
/etc/sysconfig/keepalived:
  file.managed:
    - source: salt://keepalived/files/keepalived.sysconfig
    - user: root
    - group: root
    - mode: 644
/etc/init.d/keepalived:
  file.managed:
    - source: salt://keepalived/files/keepalived.init
    - user: root
    - group: root
    - mode: 755
keepalived-init:
  cmd.run:
    - name: chkconfig --add keepalived
    - unless: chkconfig --list | grep keepalived
    - require:
      - file: /etc/init.d/keepalived
/etc/keepalived:
  file.directory:
    - user: root
    - group: root
    - mode: 755
