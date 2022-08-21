docker run -d -p 2222:22 -p 8080:80 -p 443:443   --name gitlab  --hostname gitlab.riyadh.lan  --platform linux/amd64 --restart unless-stopped --shm-size 256m -v gitlab_config:/etc/gitlab  -v gitlab_logs:/var/log/gitlab  -v gitlab_data:/var/opt/gitlab gitlab/gitlab-ce:14.7.0-ce.0

