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

// ���ڿͻ��˶���
Potato::Application* Potato::CreateApplication()
{
	return new Sanbox();
}