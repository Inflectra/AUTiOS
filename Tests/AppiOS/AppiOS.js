
function Test()
{
	RVL.DoPlayScript("AppiOS.rvl.xlsx", Tester.GetParam("sheetName", "RVL"));
}

function TestPrepare()
{
	AppiumDriver.ReconnectSession(true);
}

function TestFinish()
{
	if(Tester.GetTestStatus() != Tester.Pass)
	{
		iOS.DoScreenshot();
	}

	if (g_entryPointName == "Test")
	{
		AppiumDriver.Quit();
	}
}

g_load_libraries=["Mobile"];


