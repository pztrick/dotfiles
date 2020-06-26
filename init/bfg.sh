#!/bin/bash
set -e

# install java
sudo apt -y install default-jre-headless

# fetch latest bfg.jar
sudo wget https://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar -O /usr/local/bin/bfg-latest.jar

# install to /usr/local/bin
echo -e "#!/bin/bash\njava -jar /usr/local/bin/bfg-latest.jar \$@" | sudo tee /usr/local/bin/bfg

# mark executable
sudo chmod +x /usr/local/bin/bfg
