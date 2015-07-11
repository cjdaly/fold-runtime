## join the fold

### prerequisites

- Linux
- Java 7 or 8
- Ant (try `ant -version` and `sudo apt-get install ant`)
- lsof (on rPi run `sudo apt-get install lsof`)

### initial setup

    cd
    git clone https://github.com/cjdaly/fold-runtime.git
    cd fold-runtime
    ant -f fold-setup.xml

Also need to make sure `/etc/security/limits.conf` has lines like this for the fold user (`pi` in example below):

    pi hard nofile 40000
    pi soft nofile 40000

### normal operation

    ./fold.sh status
    ./fold.sh start

To connect from a browser on the local machine, use [http://localhost:8421/fold](http://localhost:8421/fold).

To connect from another machine, check fold log (`tail -f fold.log`) for fold URLs with IP addresses, or use `ifconfig` to determine fold machine IP addr and construct numerical URL like [http://127.0.0.1:8421/fold](http://127.0.0.1:8421/fold).

To shutdown:

    ./fold.sh stop

### more info

See the [fold](https://github.com/cjdaly/fold) development repo.
