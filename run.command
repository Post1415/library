rm public/log.html
em public/index.html
rm output.xml
robot ./
mv report.html public/index.html
firebase login
firebase deploy