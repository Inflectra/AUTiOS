
function Test()
{
	if (!SeSConnectMobile())
	{
		return;
	}

	TestDevice();
	TestElement();	
	TestMasterTable();
	TestBasicControls();
	TestAdvancedControls();

	// Not supported any more
	//SeSMobileDoExecuteScriptIOS("" + UIAutomation + "\r\n UIAutomation();");

	Global.DoSleep(3000);
}

g_load_libraries=["Mobile"];


