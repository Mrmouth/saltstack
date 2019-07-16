include:
  - pkg.pkg-init
libevent-install:
  file.managed:
    - name: /root/tools/libevent-2.0.22-stable.tar.gz
    - source: salt://libevent/files/libevent-2.0.22-stable.tar.gz
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - name: tar -zxf /root/tools/libevent-2.0.22-stable.tar.gz -C /usr/local/ && cd /usr/local/libevent-2.0.22-stable/ && ./configure --prefix=/usr/local/libevent && make && make install
    - unless: test -d /usr/local/libevent
    - require:
      - file: libevent-install
