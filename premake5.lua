workspace "Potato"
	configurations {"Debug","Release","Dist"}
	architecture "x64"
    startproject "Sandbox"  -- 设置默认启动项目
    warnings "Extra"       -- 启用额外警告

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Potato"
	location "Potato"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

	includedirs{ "%{prj.name}/src", "%{prj.name}/vendor/spdlog/include" }

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		defines { "PT_PLATFORM_WINDOWS","PT_BUILD_DLL" }
		buildoptions { "/utf-8" }
		postbuildcommands { "{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox" }

	filter "configurations:Debug"
		defines { "PT_DEBUG" , "_DEBUG" }
		symbols "On"
		runtime "Debug"

	filter "configurations:Release"
		defines { "PT_RELEASE" , "NDEBUG" }
		optimize "On"
		runtime "Release"

	filter "configurations:Dist"
		defines { "PT_DIST" , "NDEBUG" }
		optimize "Full"
		linktimeoptimization "On"
		runtime "Release"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	-- 依赖于Potato项目
	dependson { "Potato" }

	-- 设置输出目录和中间目录
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	-- 包含Sandbox项目的源文件
	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

	-- 包含Potato项目的头文件目录
	includedirs { "Potato/vendor/spdlog/include", "Potato/src" }

	-- 链接Potato项目的库
	links { "Potato" }

	filter "system:windows"

		-- 设置C++标准
		cppdialect "C++17"

		-- 设置静态运行时
		staticruntime "On"

		-- 设置Windows平台相关选项
		systemversion "latest"

		-- 设置编译选项
	    buildoptions { "/utf-8" }

		-- 定义Windows平台相关宏
		defines { "PT_PLATFORM_WINDOWS" }

	filter "configurations:Debug"
		defines { "PT_DEBUG" , "_DEBUG" }
		symbols "On"
		runtime "Debug"

	filter "configurations:Release"
		defines { "PT_RELEASE" , "NDEBUG" }
		optimize "On"
		runtime "Release"

	filter "configurations:Dist"
		defines { "PT_DIST" , "NDEBUG" }
		optimize "Full"
		linktimeoptimization "On"
		runtime "Release"