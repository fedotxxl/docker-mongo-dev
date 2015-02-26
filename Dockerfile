#to run this container use
#docker run --net=host -t -v /job_on_current_machine/:/job fbelov/mongo-dev &

#container params
#/job/mongo/data - data
#/job/mongo/log - logs

FROM phusion/baseimage

#port
EXPOSE 27017

#copy docker file
ADD Dockerfile /Dockerfile

#install mongodb
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
RUN apt-get update
RUN sudo apt-get install -y mongodb-org

#run mongodb
RUN mkdir /etc/service/mongodb
ADD service/mongodb.sh /etc/service/mongodb/run

#COMMON PARTS FOR MOST CONTAINERS
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


