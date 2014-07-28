FROM dockerfile/ubuntu
MAINTAINER Ben Marini <bmarini@gmail.com>

# Install ruby dependencies
RUN apt-get update && \
    apt-get install -y zlib1g-dev \
    libssl-dev \
    libreadline6-dev \
    libyaml-dev \
    libpq-dev

# Install ruby
ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz /tmp/
RUN cd /tmp && \
    tar -xzf ruby-2.1.2.tar.gz && \
    cd ruby-2.1.2 && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/ruby-2.1.2*

# Install bundler
RUN gem install bundler
