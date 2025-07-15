#pragma once

#ifdef PT_PLATFORM_WINDOWS

extern Potato::Application* Potato::CreateApplication();

int main(int args,char** argv)
{
	auto app = Potato::CreateApplication();

	app->Run();
	delete app;
}

#endif // PT_PLATFORM_WINDOWS
