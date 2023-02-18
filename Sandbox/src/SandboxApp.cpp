#include <Weasel.h>

class Sandbox : public Weasel::Application
{
public: 
	Sandbox()
	{

	}
	~Sandbox()
	{

	}
};

Weasel::Application* Weasel::CreateApplication()
{
	return new Sandbox();
}
