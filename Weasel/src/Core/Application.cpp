#include "Application.h"

#include "Events/ApplicationEvent.h"
#include "Core/Log.h"

namespace Weasel 
{
	Application::Application() 
	{

	}

	Application::~Application() 
	{

	}

	void Application::Run() 
	{

		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication)) {
			WS_TRACE(e);
		}

		if (e.IsInCategory(EventCategoryInput)) {
			WS_TRACE(e);
		}
		while (true) 
		{
			


		}
	}
}