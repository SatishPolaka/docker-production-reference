FROM nginxinc/nginx-unprivileged:stable-alpine   # Nginx image designed to run without root
COPY index.html /usr/share/nginx/html/index.html # Add static application content
EXPOSE 8080                                      # Unprivileged Nginx listens on port 8080
