FROM openjdk:11


WORKDIR /app


COPY . /app

COPY HelloWorld.java /app
RUN javac HelloWorld.java


RUN apt-get update
RUN apt-get install -y python3


RUN echo '#!/bin/sh' > run.sh
RUN echo 'java HelloWorld' >> run.sh
RUN echo 'python3 hello.py' >> run.sh
RUN chmod +x run.sh

CMD ["sh", "run.sh"]