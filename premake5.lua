workspace "Potato"
	configurations {"Debug","Release","Dist"}
	architecture "x64"
    startproject "Sandbox"  -- ����Ĭ��������Ŀ
    warnings "Extra"       -- ���ö��⾯��

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

	-- ������Potato��Ŀ
	dependson { "Potato" }

	-- �������Ŀ¼���м�Ŀ¼
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	-- ����Sandbox��Ŀ��Դ�ļ�
	files { "%{prj.name}/src/**.h", "%{prj.name}/src/**.cpp" }

	-- ����Potato��Ŀ��ͷ�ļ�Ŀ¼
	includedirs { "Potato/vendor/spdlog/include", "Potato/src" }

	-- ����Potato��Ŀ�Ŀ�
	links { "Potato" }

	filter "system:windows"

		-- ����C++��׼
		cppdialect "C++17"

		-- ���þ�̬����ʱ
		staticruntime "On"

		-- ����Windowsƽ̨���ѡ��
		systemversion "latest"

		-- ���ñ���ѡ��
	    buildoptions { "/utf-8" }

		-- ����Windowsƽ̨��غ�
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