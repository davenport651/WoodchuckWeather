FROM ubuntu:latest
ENV apikey=weather
ENV mapkey=mapbox

WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive apt-get update >/dev/null && apt-get install -y >/dev/null && apt-get install git npm nodejs -y >/dev/null
RUN git clone https://github.com/davenport651/WoodchuckWeather.git
RUN cd Weatherscan && npm install --production

CMD sed -i "s/var api_key = 'YOUR_API_KEY'/var api_key = $apikey/" Weatherscan/webroot/js/config.js
CMD sed -i "s/var map_key = 'YOUR_API_KEY'/var api_key = $mapkey/" Weatherscan/webroot/js/config.js
CMD cd WoodchuckWeather && npm start

EXPOSE 8080/tcp
EXPOSE 8081/tcp
