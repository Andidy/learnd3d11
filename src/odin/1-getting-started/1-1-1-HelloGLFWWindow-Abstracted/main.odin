package main

import "core:fmt"

import app "hello_window_application"

main :: proc () {
	hello_window_application := app.CreateHelloWindowApplication("Learn D3D11 - Hello Window Abstracted")
	hello_window_application->Run()
}