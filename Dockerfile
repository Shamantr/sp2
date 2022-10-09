FROM ubuntu
RUN apt-get -qq update
RUN apt-get install gcc gdb gcc-multilib nano -qq > /dev/null
COPY lb2a.s .
RUN gcc -m32 lb2a.s -o lb2a
CMD ./lb2a
