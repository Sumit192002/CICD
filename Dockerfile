# Use the official Nginx image as the base image
FROM nginx:latest

# Copy the custom index.html to the Nginx default HTML directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to the outside world
EXPOSE 81

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
