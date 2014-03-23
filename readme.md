# InstaSatis

Quickly get a [Satis](https://getcomposer.org/doc/articles/handling-private-packages-with-satis.md) 
mirror up-and-running using [Vagrant](http://www.vagrantup.com/) & [Salt](http://www.saltstack.com/).

## Install

Install Vagrant
Clone the repo
Get a "[personal access token](https://github.com/settings/applications)" for github 
Follow instructions in the `github-token-example.sls` file
`vagrant up`
Browse to http://192.168.56.10/

## Modifying

You can add any "require" values you want to the satis-config file and then just 
run 'vagrant provision' again to updated it. That said, be cautioned -- satis does
not multithread the build process, so if you have it pull down a large number of 
packages, it can take _quite_ some time.

## Notes/TODOs

 - This satis config has "archive" turned on which means that it will build and 
   store a copy of each package it hosts. You can thus use this setup if you wish
   to make packages available in case github, or whatever, is offline etc. You can
   disable this behavior by removing the "archive" section in the JSON config.
 - No CRON'ed satis (re)build calls
 - Totes' not safe for a real production deployment (Vagrant boxes come with a 
   publicly known SSH keypair.)

## References

 - http://kurakin.info/composer-satis-and-github-rate-limit/
 - http://code.tutsplus.com/tutorials/setting-up-a-local-mirror-for-composer-packages-with-satis--net-36726
