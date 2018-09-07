# AmiiboApp

This iOS app has two screens:

Amiibo List Screen​ - Displays a list of Amiibos when the app is first launched. The list displays the name and Amiibo series for each Amiibo. The folks at​ ​amiiboapi.com​ have built a restful service that is used to get this list.

Amiibo Detail Screen​ - This screen displays the selected Amiibo’s name, Amiibo series and the US/North America Release date.

GET​ ​http://www.amiiboapi.com//api/amiibo/?type=figure
