# Clone Upstream
git clone https://gitlab.freedesktop.org/emersion/libdisplay-info
cp -rvf ./debian ./libdisplay-info
mv ./libdisplay-info ./display-info
cd ./display-info

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p display-info_0.1.1
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
