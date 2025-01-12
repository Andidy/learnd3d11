package framework

import "core:fmt"
import "core:strings"
import "vendor:glfw"

Application :: struct {
	window : glfw.WindowHandle,
	dimensions : [2]u32,
	title : string,
}

GetWindowWidth :: proc (app : ^Application) -> (width : u32) {
	return app.dimensions.x
}

GetWindowHeight :: proc (app : ^Application) -> (height : u32) {
	return app.dimensions.y
}

Cleanup :: proc (using app : ^Application) {
	if window != nil {
		glfw.DestroyWindow(window)
		window = nil
	}
	glfw.Terminate()
}

Initialize :: proc (using app : ^Application) -> (ok : b32) {
	result := glfw.Init()
	if result == 0 {
		fmt.println("GLFW: Unable to initialize")
		return false
	}

	primary_monitor := glfw.GetPrimaryMonitor()
	video_mode := glfw.GetVideoMode(primary_monitor)
	dimensions.x = u32(f32(video_mode.width) * 0.9)
	dimensions.y = u32(f32(video_mode.height) * 0.9)

	glfw.WindowHint(glfw.SCALE_TO_MONITOR, 0)
	glfw.WindowHint(glfw.CLIENT_API, glfw.NO_API)
	window = glfw.CreateWindow(i32(dimensions.x), i32(dimensions.y), strings.clone_to_cstring(title), nil, nil)
	if window == nil {
		fmt.println("GLFW: Unable to create window")
		return false
	}

	window_left := video_mode.width / 2 - i32(dimensions.x) / 2
	window_top := video_mode.height / 2 - i32(dimensions.y) / 2
	glfw.SetWindowPos(window, window_left, window_top)
	return true
}