# Coronavirus Stats
The purpose of this app is to display the latest statistics and information related with the Coronavirus outbreak 

## API
The main datasouce is the https://corona.lmao.ninja/ api

## Web version
to run the web version use this command line:
- `flutter run -d chrome --web-hostname localhost --web-port 5000 -t lib/main.dart`

## Google Maps
To use google maps on the web version, just update the dependencies in the `common` module  [pubspec.yml](gmap/common/pubspec.yml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  web:
    path: ../web/
  mobile:
    path: ../mobile/
  coronavirus_stats_app:
    path: ../../
```
comment the unused dependency `web` or `mobile`
Also update the file [gmap_widget.dart](gmap/common/lib/gmap_widget.dart)

## Inspiration features
- https://github.com/Amulya-Kumar/coronavirus-tracker

## Inspiration designs 
- https://www.uplabs.com/posts/covid-19-tracking-app-design
