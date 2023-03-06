#pragma once



#ifdef WS_PLATFORM_WINDOWS
	#ifdef WS_BUILD_DLL
		#define WEASEL_API __declspec(dllexport)
	#else
		#define WEASEL_API __declspec(dllimport)
	#endif
#else
	#error Weasel only supports Windows!
#endif

#define BIT(x) (1 << x)