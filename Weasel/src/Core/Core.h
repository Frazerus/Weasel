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

#ifdef WS_ENABLE_ASSERTS
	#define WS_ASSERT(x, ...) { if(!(x)) { WS_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
	#define WS_CORE_ASSERT(x, ...) { if(!(x)) { WS_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); } }
#else
	#define WS_ASSERT(x, ...)
	#define WS_CORE_ASSERT(x, ...)
#endif

#define BIT(x) (1 << x)