project "box2d"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	cdialect "C17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.cpp",
		"src/**.c",
		"include/**.h"
	}

	includedirs
	{
		"include",
		"src"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "action:vs*"
		buildoptions { "/experimental:c11atomics" } -- 添加C11标准和实验性C11原子操作支持

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
