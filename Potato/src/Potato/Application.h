#pragma once

#include "Core.h"

namespace Potato
{
	class POTATO_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// 将在客户端定义
	Application* CreateApplication();

}
