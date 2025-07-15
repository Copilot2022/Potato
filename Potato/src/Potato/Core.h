#pragma once

#ifdef PT_PLATFORM_WINDOWS
	#ifdef PT_BUILD_DLL
		#define POTATO_API __declspec(dllexport)
	#else
		#define POTATO_API __declspec(dllimport)
	#endif // PT_BUILD_DLL
#else
	#error Potato only supports Windows!
#endif // PT_PLATFORM_WINDOWS
