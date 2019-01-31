
function Test()
{
	if (!SeSConnectMobile())
	{
		return;
	}
	
	iOS.DoGoToUrl("http://www.libraryinformationsystem.org");

	Global.DoSleep(3000);
	
	iOS.DoScreenshot();
	
	TestCreateNewBook();
	
	Global.DoSleep(5000);
}

g_load_libraries=["Mobile"];


