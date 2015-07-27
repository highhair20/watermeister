
On initial start up of the hardware controller.


* Hardware controller does a GET to /init in order to obtain the configuration block.
```
{
  config: {
    location: {
      source: http://ip-api.com/json
    }
  }
}
```

* Hardware controller does a GET to ```config.location.source``` in order to determine it's IP
address and physical location.


* Hardware controller does a POST to /config every x minutes set it's location data.

  * Make a request to http://ip-api.com/json to get location data.
  * POST response from http://ip-api.com/json up to the server.
  * Server may respond with a config block which the client should then handle.
