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

	// ���ڿͻ��˶���
	Application* CreateApplication();

}
