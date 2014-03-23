
remi-repo:
  pkgrepo.managed:
    - name: remi
    - humanname: Les RPM de remi pour Enterprise Linux $releasever - $basearch
    - mirrorlist: http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror
    - gpgcheck: 1
    - enabled: 1
    - gpgkey: http://rpms.famillecollet.com/RPM-GPG-KEY-remi

remi-repo55:
  pkgrepo.managed:
    - name: remi-php55
    - humanname: Les RPM de remi de PHP 5.5 pour Enterprise Linux $releasever - $basearch
    - mirrorlist: http://rpms.famillecollet.com/enterprise/$releasever/php55/mirror
    - gpgcheck: 1
    - enabled: 1
    - gpgkey: http://rpms.famillecollet.com/RPM-GPG-KEY-remi
    - require:
      - pkgrepo: remi
