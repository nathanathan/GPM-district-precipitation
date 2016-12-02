INSTALL_DIR=`pwd`
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable && sudo apt-get update
sudo apt-get install gdal-bin
sudo apt-get install python-gdal
sudo apt-get install libhdf5-dev libgdal1-dev
pip install -r requirements.pip

# Install mpl basemap
rm $VIRTUAL_ENV/lib/python*/no-global-site-packages.txt
wget http://sourceforge.net/projects/matplotlib/files/matplotlib-toolkits/basemap-1.0.7/basemap-1.0.7.tar.gz/download -O $INSTALL_DIR/basemap.tar.gz
tar -xvzf basemap.tar.gz
cd basemap-1.0.7/geos-3.3.3
export GEOS_DIR=$INSTALL_DIR/geos
./configure --prefix=$GEOS_DIR 
make; make install
cd ..
python setup.py install

# Download uganda district shapefiles
wget http://mapeastafrica.com/?wpdmdl=1696 -O $INSTALL_DIR/uganda-districts.shp.zip
cd $INSTALL_DIR ; unzip $INSTALL_DIR/uganda-districts.shp.zip

# Download satalite weather data (size is aprox. 50GB per year)
cd $INSTALL_DIR ; ncftpget -R -u breit@ecohealthalliance.org -p breit@ecohealthalliance.org \
ftp://jsimpson.pps.eosdis.nasa.gov/NRTPUB/imerg/early/

# Download data from the HUEN weather station in Entebbe
wget "https://www.wunderground.com/history/airport/HUEN/2016/1/1/CustomHistory.html?dayend=30&monthend=11&yearend=2016&req_city=&req_state=&req_statename=&reqdb.zip=&reqdb.magic=&reqdb.wmo=&format=1" \
-O $INSTALL_DIR/HUEN.csv
