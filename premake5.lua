project "SDL_gfx"
    kind "StaticLib" -- or "SharedLib" if you want to build a DLL
    language "C"
    
    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin/int-" .. outputdir .. "/%{prj.name}")

    -- Source files
    files {
        "*.c",  -- Assuming the SDL_gfx source files are in the src directory
        "*.h"  -- Include all header files
    }

     -- Include directories
     includedirs {
         -- Path to your SDL headers
         "%{IncludeDir.SDL2}",
    }

    libdirs
    {
        "%{LibDir.SDL2}",
    }

    -- This is for overriding the [.lib] for [.a] libraries
	premake.override(premake.tools.msc, "getLibraryExtensions", function(oldfn)
		local extensions = oldfn()
		extensions["a"] = true
		return extensions
	  end)

    links
    {
        "SDL2"
    }

    filter "system:windows"
    cppdialect "C++20"
    staticruntime "on" -- for linking runtime libraries
    systemversion "latest"

