  local module_name = "gtest-samples"
  local build_dir = "../build"
  local target_dir = build_dir.."/target"
  local obj_dir = build_dir.."/obj"
  local tools_dir = "../tools"

  solution (module_name)
      configurations { "Debug", "Release" }
      language "C++"
      location (build_dir)
      flags { "Symbols" }
 
   project (module_name)
      location (build_dir)
      kind "ConsoleApp"
	  files {"src/**.cpp", "test/**.cpp", "include/**.h"}
	  targetdir (target_dir)
	  includedirs {"include", tools_dir.."/gtest/include",tools_dir.."/mockcpp/include", tools_dir.."/3rdparty"}
	  objdir (obj_dir)
	  links { "gtest_main", "gtest", "mockcpp4gtest", "pthread" }	  
	  libdirs { tools_dir.."/gtest/lib",tools_dir.."/mockcpp/lib" }
