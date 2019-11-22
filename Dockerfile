# 
# Bedework quickstart dockerfile
#
# Run with:
#  #docker run -p 8080:8080 bedework
#  #firefox http://localhost:8080/bedework
#
# Further setup instructions here https://wiki.jasig.org/display/BWK310/Running+Bedework
#
FROM java:7
#RUN yum -y install supervisor && yum clean all
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf 

RUN wget  http://dev.bedework.org/downloads/3.10.4/quickstart-3.10.4.zip  -O /quickstart-3.10.4.zip \
	&& unzip /quickstart-3.10.4.zip  -x "*/*/.svn/*" \
	&& rm /quickstart-3.10.4.zip

RUN mv /quickstart-3.10.4 /bedework
WORKDIR /bedework

# Setup configuration before supervisord starts bw.
RUN bash bw deployConf

EXPOSE 8080
CMD ["./startjboss -debug"]
