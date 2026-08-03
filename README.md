# README

## Ergebnisse der API testen

### Lokalen Rails Server starten (im Projektverzeichnis)
```
bin/rails server
```
oder
```
rails s
```

### API über Browser aufrufen
* `http://localhost:3000/api/v1/agencies` zur Anzeige der Verkehrunternehmen
* `http://localhost:3000/api/v1/routes` zur Anzeige aller Linien
* `http://localhost:3000/api/v1/routes/:id` zur Anzeige einer bestimmten Linie (Angabe der route_id)
* `http://localhost:3000/api/v1/stops` zur Anzeige aller Haltestellen
* `http://localhost:3000/api/v1/stops/:id` zur Anzeige einer bestimmten Haltestelle (Angabe der stop_id)
* `http://localhost:3000/api/v1/trips` zur Anzeige aller Fahrten
* `http://localhost:3000/api/v1/trips/:id` zur Anzeige einer bestimmten Fahrt (Angabe der trip_id)
