## join the fold

### prerequisites

- Linux
- Java 7 or 8

### initial setup

First make sure Linux tool dependencies are installed:

    sudo apt-get update
    sudo apt-get install ant git gnuplot lsof

Then setup fold area:

    cd
    git clone https://github.com/cjdaly/fold-runtime.git
    cd fold-runtime
    ant -f fold-setup.xml

You may need to edit `/etc/security/limits.conf` (as root) to increase the open files limit for the fold user.  Check the output of the ant script for details on this and other manual setup steps.

### normal operation

    ./fold.sh status
    ./fold.sh start

To connect from a browser on the local machine, use [http://localhost:8421/fold](http://localhost:8421/fold).

To connect from another machine, check fold log (`head fold.log`) for fold URLs with IP addresses, or use `ifconfig` to determine fold machine IP address and construct numerical URL with port `8421` like [http://127.0.0.1:8421/fold](http://127.0.0.1:8421/fold).

To shutdown:

    ./fold.sh stop

### updating

Make sure the fold server is stopped and you are in the `fold-runtime` directory, then do:

    git pull

### more info

See the [fold](https://github.com/cjdaly/fold) development repo.
