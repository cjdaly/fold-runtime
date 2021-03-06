## join the fold

### prerequisites

- Linux
- Java 7 or 8

### initial setup

First make sure Linux tool dependencies are installed:

    sudo apt-get update
    sudo apt-get install ant git gnuplot graphviz lsof

Then setup fold area:

    cd
    git clone https://github.com/cjdaly/fold-runtime.git
    cd fold-runtime
    ./fold.sh update

Check the output for indications of any additional setup steps.  You may need to edit `/etc/security/limits.conf` (as root) to increase the open files limit for the fold user.  Run `./fold.sh update` again after making changes to confirm successful setup checks.

__Recommended:__ Reboot at this point (with `sudo shutdown -r now`) to make sure all system changes take effect.

### normal operation

    cd ~/fold-runtime
    ./fold.sh status
    ./fold.sh start

To connect from a browser on the local machine, use [http://localhost:8421/fold](http://localhost:8421/fold).

To connect from another machine, check fold log (`tail -f fold.log`) for fold URLs with IP addresses, or use `ifconfig` to determine fold machine IP address and construct numerical URL with port `8421` like [http://127.0.0.1:8421/fold](http://127.0.0.1:8421/fold).

To shutdown:

    ./fold.sh stop

### updating

__Note:__ The fold server must be stopped before updating!

    ./fold.sh update

### more info

See the [fold](https://github.com/cjdaly/fold) development repo.
