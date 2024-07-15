#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1
echo BEGIN
date '+%Y-%m-%d %H:%M:%S'
yum update -y
yum install -y httpd cronie
cat <<'EOF' >> /var/www/html/index.html
<html>
<head>
<title>Success!</title>
<style>
body {
background-image: url('https://ce-test-bg-image-onica.s3-us-west-2.amazonaws.com/onica.jpg');
background-repeat: no-repeat;
background-attachment: fixed;
background-position: center;
</style>
</head>
<body>
<h1>Hello Onica!</h1>
</body>
</html>
EOF
systemctl start httpd
systemctl start crond
systemctl enable httpd
systemctl enable crond
mkdir /tmp/logrotate/
cat <<'EOF' >> /tmp/apache_logs.sh
#!/bin/bash
zip -r /tmp/logrotate/apache-logs-$(date '+%d-%m-%Y-%H:%M:%S').zip /var/log/httpd/
cd /tmp/logrotate/ 
ls -tp | grep -v '/$' | tail -n +31 | xargs -I {} rm -- {}
aws s3 sync /tmp/logrotate s3://"${s3_logs_bucket}"
EOF
chmod +x /tmp/apache_logs.sh
crontab<<EOF
0 1 * * * sh /tmp/apache_logs.sh
EOF
