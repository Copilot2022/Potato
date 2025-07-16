#include "Application.h"

#include "Potato/Events/ApplicationEvent.h"
#include "Potato/Log.h"

namespace Potato
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
		if (e.IsInCategory(EventCategoryApplication))
		{
			PT_CORE_INFO("WindowResizeEvent is in Application category");
			PT_CORE_INFO("Width: {0}, Height: {1}", e.GetWidth(), e.GetHeight());
		}
		else
		{
			PT_CORE_ERROR("WindowResizeEvent is NOT in Application category");
		}

		while (true);
	}
}