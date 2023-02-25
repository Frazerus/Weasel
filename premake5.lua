workspace "Weasel"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.systeym}-%{cfg.architecture}"

project "Weasel"
	location "Weasel"
	kind "SharedLib"
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
		"%{prj.name}/vendor/spdlog/include"
	}

	postbuildcommands
	{
		("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "10.0.22000.0"

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
		systemversion "10.0.22000.0"

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