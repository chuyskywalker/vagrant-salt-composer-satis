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

 - No CRON'ed satis (re)build calls
 - Totes' not safe for a real production deployment (Vagrant boxes come with a 
   publicly known SSH keypair.)

## References

 - http://kurakin.info/composer-satis-and-github-rate-limit/
 - http://code.tutsplus.com/tutorials/setting-up-a-local-mirror-for-composer-packages-with-satis--net-36726
