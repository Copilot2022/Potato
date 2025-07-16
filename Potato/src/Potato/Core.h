#pragma once

#ifdef PT_PLATFORM_WINDOWS
	#ifdef PT_BUILD_DLL
		#define POTATO_API __declspec(dllexport)
	#else
		#define POTATO_API __declspec(dllimport)
	#endif
#else
	#error Potato only supports Windows!
#endif

#define BIT(x) (1 << x)