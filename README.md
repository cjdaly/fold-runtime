## join the fold

### prerequisites

- Linux (for now)
- Java 7 or 8
- Ant (try `ant -version` and `sudo apt-get install ant`)

### initial setup

    cd
    git clone https://github.com/cjdaly/fold-runtime.git
    cd fold-runtime
    ant fold-setup.xml

### normal operation

    ./fold.sh status
    ./fold.sh start
    ./fold.sh stop

