# UberEATS Reverse Engineering
This app is meant to be used as demo and show the filter viewcontroller for the restaurants.

# Server
- installing the golang
```
brew install go
```

- install packages
```
go get -u github.com/gorilla/mux
```
- start the server
```
cd Server
go build
./Server
```
- test the endpoint
```
curl -X GET http://localhost:8000/people
```