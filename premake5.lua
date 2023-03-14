workspace "Weasel"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.systeym}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["GLFW"] = "Weasel/vendor/GLFW/include"

include "Weasel/vendor/GLFW"


project "Weasel"
	location "Weasel"
	kind "SharedLib"
	language "C++"

	targetdir  ("bin/" .. outputdir .. "/%{prj.name}")
	objdir  ("obj/" .. outputdir .. "/%{prj.name}")

	pchheader "wspch.h"
	pchsource "Weasel/src/wspch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}"
	}

	links
	{
		"GLFW",
		"opengl32.lib"
	}

	postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"WS_PLATFORM_WINDOWS",
			"WS_BUILD_DLL"
		}

	filter "configurations:Debug"
		defines "WS_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "WS_RELEASE"
		optimize "On"

	filter "configurationsDist"
		defines "WS_DIST"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir  ("bin/" .. outputdir .. "/%{prj.name}")
	objdir  ("obj/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"Weasel/vendor/spdlog/include",
		"Weasel/src"

	}

	links
	{
		"Weasel"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"WS_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "WS_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "WS_RELEASE"
		optimize "On"

	filter "configurationsDist"
		defines "WS_DIST"
		optimize "On"