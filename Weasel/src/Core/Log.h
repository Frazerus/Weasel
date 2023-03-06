#pragma once
#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/fmt/ostr.h"
namespace Weasel {

	class WEASEL_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}
#define WS_CORE_ERROR(...)		:: Weasel::Log::GetCoreLogger()->error(__VA_ARGS__)
#define WS_CORE_INFO(...)		:: Weasel::Log::GetCoreLogger()->info(__VA_ARGS__)
#define WS_CORE_WARN(...)		:: Weasel::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define WS_CORE_TRACE(...)		:: Weasel::Log::GetCoreLogger()->trace(__VA_ARGS__)

#define WS_ERROR(...)	:: Weasel::Log::GetClientLogger()->error(__VA_ARGS__)
#define WS_INFO(...)		:: Weasel::Log::GetClientLogger()->info(__VA_ARGS__)
#define WS_WARN(...)		:: Weasel::Log::GetClientLogger()->warn(__VA_ARGS__)
#define WS_TRACE(...)	:: Weasel::Log::GetClientLogger()->trace(__VA_ARGS__)