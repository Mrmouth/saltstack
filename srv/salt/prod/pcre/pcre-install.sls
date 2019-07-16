include:
  - pkg.pkg-init
pcre-source-install:
  file.managed:
    - name: /root/tools/pcre-8.43.tar.gz
    - source: salt://pcre/files/pcre-8.43.tar.gz
    - user: root
    - group: root
    - mode: 755
  cmd.run:
    - name: tar -zxf /root/tools/pcre-8.43.tar.gz -C  /usr/local/ && cd /usr/local/pcre-8.43/ && ./configure && make && make install
    - unless: test -d /usr/local/pcre-8.43
    - require:
      - file: pcre-source-install
