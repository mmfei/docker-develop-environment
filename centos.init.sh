yum install -y wget
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
wget http://mirrors.163.com/.help/CentOS6-Base-163.repo -O /etc/yum.repos.d/CentOS-Base.repo;
yum makecache
yum install -y gcc gcc-c++ readline-devel pcre-devel openssl-devel tcl perl make

mkdir -p /data1/software/tarball;

softwarepath="/data1/software/";
tarpath="${softwarepath}tarball";

wget http://sourceforge.net/projects/pcre/files/pcre/8.36/pcre-8.36.tar.gz/download -O $tarpath/pcre-8.36.tar.gz;

tar -xvzf $tarpath/pcre-8.36.tar.gz -C $softwarepath;
cd $softwarepath/pcre-8.36;
./configure --prefix=/usr/local/pcre.8.36;
make ;
make install;
ln -s /usr/local/pcre.8.36 /usr/local/pcre;

wget https://openresty.org/download/ngx_openresty-1.9.7.1.tar.gz -O $tarpath/ngx_openresty-1.9.7.1.tar.gz;
tar xvzf $tarpath/ngx_openresty-1.9.7.1.tar.gz -C $softwarepath;
cd $softwarepath/ngx_openresty-1.9.7.1;
./configure --prefix=/usr/local/ngx_openresty.1.9.7.1 --with-luajit --with-pcre=/data1/software/pcre-8.36/
make
make install

echo "PATH=/usr/local/ngx_openresty.1.9.7.1/nginx/sbin/:\$PATH" >> /etc/bashrc;
soucre /etc/bashrc;
nginx -v;



