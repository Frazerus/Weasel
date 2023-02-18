#pragma once

#ifdef WS_PLATFORM_WINDOWS
extern Weasel::Application* Weasel::CreateApplication();
int main(int argc, char** argv)
{
	printf("Weasel Engine\n");
	auto app = Weasel::CreateApplication();
	app->Run();
	delete app;
}
#endif
