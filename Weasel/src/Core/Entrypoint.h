#pragma once

#ifdef WS_PLATFORM_WINDOWS
extern Weasel::Application* Weasel::CreateApplication();
int main(int argc, char** argv)
{
	Weasel::Log::Init();
	WS_CORE_WARN("Initialized Log!");
	auto a = 5;
	WS_INFO("HELLO! Var = {0}", a);
	auto app = Weasel::CreateApplication();
	app->Run();
	delete app;
}
#endif
