# [Tripboard](http://35.225.21.123:9090)


Tripboard helps users plan trips.  A user searches for a place of interest by entering either a name or type of interest as well as a geographic location (for example, Cheesesteaks Philadelphia, San Francisco Bike Tours, or Little Man Ice Cream Denver).  Clicking on any of the search results brings up information that users might want to consider when planning to visit that place. Within the 'Weather' card, a user can also enter potential days that the trip might take place, and the average weather will appear for that day.

![alt text](https://github.com/adrian-lara/tripboard_fe/blob/master/src/Tripboard_SS_20180307.png "test")

### Technical Details

**This is the backend repository for this application. The frontend repository can be found [here](https://github.com/adrian-lara/tripboard_fe).**

#### Deployment

The users' link to the application can currently be found here: [Tripboard](http://35.225.21.123:9090)

A [Docker image (FE)](https://hub.docker.com/r/adrianlara/tbf/) of the frontend application is currently deployed via Kubernetes (on the Google Compute Engine).  The backend application hosting the API also has a [Docker image (BE)](https://hub.docker.com/r/adrianlara/tbb/) deployed within the same cluster.

#### APIs

The following APIs are consumed and processed (by the backend) to provide place information.
- [Google Places](https://developers.google.com/places/)
- [Weather Underground](https://www.wunderground.com/weather/api/)
- [Yelp](https://www.yelp.com/developers/documentation/v3)
