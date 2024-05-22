# Use the official MongoDB image from Docker Hub
FROM mongo

# Expose the default MongoDB port
EXPOSE 27017

# Optional: Set environment variables for MongoDB
# ENV MONGO_INITDB_ROOT_USERNAME=admin
# ENV MONGO_INITDB_ROOT_PASSWORD=password

# Optional: Copy MongoDB configuration file if needed
# COPY ./mongod.conf /etc/mongod.conf

# Optional: Create a directory for MongoDB data
VOLUME /data/db

# Optional: Create a directory for MongoDB logs
VOLUME /var/log/mongodb

# Optional: Set the working directory
WORKDIR /usr/src/app

# Optional: Copy any initialization scripts or data files
# COPY init.js /docker-entrypoint-initdb.d/

# Command to start MongoDB when the container starts
CMD ["mongod"]
