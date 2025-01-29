# Use the latest rolling release of Ubuntu as the base image
FROM ubuntu:rolling

# Update the package list and install essential packages (ca-certificates, curl, sudo)
RUN apt -y update  && apt install curl sudo ca-certificates -y --quiet --no-install-recommends

# Run a custom script to configure apt mirrors for faster package downloads
RUN sh -c "$(curl  -fsSL https://gcore.jsdelivr.net/gh/HYwooo/install@master/mirror-apt.sh)"

# Set the working directory to /root
WORKDIR /root

CMD ["/bin/bash"]
