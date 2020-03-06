package main

import (
	"fmt"
	"log"
	"net/http"
	"net/url"
	"os"
)

var (
	channel  string
	head string
	body string
)

func init() {
	channel = os.Getenv("PLUGIN_CHANNEL")
	head = os.Getenv("PLUGIN_HEAD")
	body = os.Getenv("PLUGIN_BODY")
}

func main() {
	if channel == "" || head == "" {
		log.Fatalln("channel or head is required")
	}
	head = url.QueryEscape(head)
	if body != "" {
		body = url.QueryEscape(body)
	}

	reqURL := fmt.Sprintf("http://push.ijingniu.cn/send?key=%s&head=%s&body=%s", channel, head, body)
	_, err := http.Get(reqURL)
	if err != nil {
		log.Fatalln("post error: ", err)
	}
}
