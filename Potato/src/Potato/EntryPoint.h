#pragma once

#ifdef PT_PLATFORM_WINDOWS

extern Potato::Application* Potato::CreateApplication();

int main(int args,char** argv)
{
	Potato::Log::Init();

	PT_CORE_TRACE("Core logger trace message!");
	PT_CORE_INFO("Core logger initialized successfully!");
	PT_CORE_WARN("Core logger warning message!");
	PT_CORE_ERROR("Core logger error message!");
	PT_CORE_CRITICAL("Core logger critical message!");

	PT_TRACE("Client logger trace message!");
	PT_INFO("Client logger initialized successfully!");
	PT_WARN("Client logger warning message!");
	PT_ERROR("Client logger error message!");
	PT_CRITICAL("Client logger critical message!");

	PT_INFO("Formatted client logger trace message: {0}", "Hello, World!");



	auto app = Potato::CreateApplication();
	app->Run();
	delete app;
	return 0;
}

#endif
