# Image base
FROM alpine

# Install tools
#RUN apk update && apk add --no-cache busybox-extras

# Install ping command
RUN apk update && apk add --no-cache iputils

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the script executable
RUN chown troubleshooting:troubleshooting /entrypoint.sh && chmod +x /entrypoint.sh

# To delete apk to avoid additional installations
RUN apk del apk-tools

# To delete the folder "/etc/apk" to block the access at the repositories
RUN rm -rf /etc/apk

# Create a non-privileged user
RUN adduser -D troubleshooting

# Set permissions for ping command
#RUN chmod u+s /bin/ping

# Set the non-privileged user as the default user
USER troubleshooting

# Command to run ping/telnet by default
#ENTRYPOINT ["telnet"] 
#ENTRYPOINT ["ping", "-c", "10"]

#Probar ping con ENTRYPOINT y CMD de esta forma
#ENTRYPOINT ["ping"]
#CMD ["-c", "10"]

# Command to run the entrypoint script by default
ENTRYPOINT ["/entrypoint.sh"]