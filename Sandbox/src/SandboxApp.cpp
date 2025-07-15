#include <Potato.h>

class Sanbox : public Potato::Application
{
public:
	Sanbox() 
	{

	}

	~Sanbox()
	{

	}
};

// 将在客户端定义
Potato::Application* Potato::CreateApplication()
{
	return new Sanbox();
}