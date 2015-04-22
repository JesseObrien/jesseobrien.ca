package main

import (
	"flag"
	"github.com/codegangsta/negroni"
	"github.com/unrolled/render"
	"net/http"
)

var httpPort string
var httpAddress string

func init() {
	flag.StringVar(&httpPort, "port", "8080", "The port you wish to bind the server to.")
	flag.StringVar(&httpAddress, "ip", "127.0.0.1", "The IP address to bind to")

	flag.Parse()
}

func main() {
	mux := http.NewServeMux()

	r := render.New(render.Options{
		Asset:      Asset,
		AssetNames: AssetNames,
	})

	mux.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		r.HTML(w, http.StatusOK, "index", nil)
	})

	n := negroni.New(negroni.NewRecovery(), negroni.NewLogger(), negroni.NewStatic(assetFS()))

	n.UseHandler(mux)

	n.Run(httpAddress + ":" + httpPort)
}
