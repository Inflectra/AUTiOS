//Put your custom functions and variables in this file

function TestDevice()
{
	Tester.AssertEqual("Device orientation is Portrait (0)", 0, iOS.GetDeviceOrientation());
	iOS.SetDeviceOrientation(iOS.ORIENTATION_LANDSCAPE);	
	Tester.AssertEqual("Device orientation is Landscape (1)", 1, iOS.GetDeviceOrientation());
	iOS.SetDeviceOrientation(iOS.ORIENTATION_PORTRAIT);
	//iOS.DoShake();	
}

function TestSwitchSliderImage()
{
	Tester.AssertEqual("Switch is off", SeS('Switch').GetChecked(), false);
	SeS('Switch').SetChecked(true);
	Tester.AssertEqual("Switch is on", SeS('Switch').GetChecked(), true);
	Tester.AssertEqual("Slider is at 50%", SeS('Slider').GetValue(), "50%");
	SeS("Slider").SetValue(0.18);
	Tester.AssertEqual("Slider is at 16%", SeS('Slider').GetValue(), "16%");
	Tester.AssertEqual("Image width is 36", SeS('Image').GetWidth(), 36);
	Tester.AssertEqual("Image height is 35", SeS('Image').GetHeight(), 35);
}

function TestTable()
{
	var listView = SeS('UIATableView');	
	var itemCount = listView.GetItemCount();
	Tester.AssertEqual("Item count is 4", itemCount, 4);
	
	var itemText = listView.GetItemTextAt(0);
	Tester.AssertEqual("Item name is 'Button'", itemText, "Button");
	
	for(var i = 0; i < itemCount; i++)
	{
		var itemText = listView.GetItemTextAt(i);
		Tester.Message(itemText);
	}

	var index = listView.GetItemIndexByName("Text");
	Tester.AssertEqual('Text index is 1', index, 1);
	
	listView.DoSelectItem(1);
	Global.DoSleep(1000);
	SeS('Back').DoClick();
	Global.DoSleep(1000);
}

function TestAddRemove()
{
	//var newItemName = "Tree";
	
	// Due to BUG in Appium bridge temporarily make it 
	var newItemName = "New Control 4";

	SeS('Add').DoClick();
	//SeS('Text').SetText('Tree');
	SeS('Save').DoClick();
	
	var listView = SeS('UIATableView');
	var itemCount = listView.GetChildCount();
	Tester.AssertEqual("Item count is 5", itemCount, 5);
	
	var itemText = listView.GetItemTextAt(0);
	Tester.AssertEqual("Item name is " + newItemName, itemText, newItemName);	

	SeS('Edit').DoClick();
	Global.DoSleep(1000);
	SeS('Delete_Button').DoClick();
	Global.DoSleep(1000);
	SeS('Delete_Confirm').DoClick();
	SeS('Done').DoClick();

	listView = SeS('UIATableView');
	var itemCount = listView.GetChildCount();
	Tester.AssertEqual("Item count is 4", itemCount, 4);
}

function TestButtonEditLabel()
{
	SeS('Message').SetText('Hello World!');
	SeS('Send').DoClick();
	Tester.AssertEqual("Alert shows 'Hello World!'", SeS('qqq').GetText(), 'Hello World!');
	SeS('OK').DoClick();

	SeS('UserName').SetText('User');
	SeS('Password').SetText('pwd');
	SeS('Login').DoClick();
	Tester.AssertEqual("Login data is correct", SeS('login_data').GetText(), "User/pwd");
}

function TestPicker()
{
	var picker = SeS('Picker');
	var value = picker.GetSelectedItem();
	Tester.AssertEqual("Current value is 'Mercury'", value, "Mercury");

	picker.DoSelectItem("Earth");
	value = picker.GetSelectedItem();
	Tester.AssertEqual("Current value is 'Earth'", value, "Earth");
}

function UIAutomation()
{
	var target = UIATarget.localTarget();
	target.frontMostApp().mainWindow().tableViews()[0].tapWithOptions({tapOffset:{x:0.17, y:0.15}});
	target.frontMostApp().navigationBar().leftButton().tap();
	target.delay(1);	     
	var cnt = target.frontMostApp().toolbar().buttons()["Contents"];
	cnt.tap();
	target.frontMostApp().navigationBar().leftButton().tap();
	return "success";
}

function TestAdvControls()
{
	var tabBar = SeS('TabBar');
	Tester.AssertEqual("TabBar has 2 tabs", tabBar.GetItemCount(), 2);
	Tester.AssertEqual("1 st tab is Favorites", tabBar.GetTabName(0), "Favorites");
	tabBar.DoSelectTab(0);
	Tester.AssertEqual("Selected tab is Favorites", tabBar.GetSelectedTab(), "Favorites");
	tabBar.DoSelectTab("More");
	Tester.AssertEqual("Selected tab is More", tabBar.GetSelectedTab(), "More");

	var pageIndicator = SeS('PageIndicator');
	Tester.AssertEqual("PageIndicator has 'page 1 of 3'", "page 1 of 3", pageIndicator.GetProperty("value"));
	
	/**
	 * no support in appium or WDA at the moment, used to work with UIAutomation
	 *
	Tester.AssertEqual("PageIndicator has 3 pages", pageIndicator.GetItemCount(), 3);	
	pageIndicator.DoNextPage();
	Tester.AssertEqual("Current page is 1", pageIndicator.GetPageIndex(), 1);	
	pageIndicator.DoPrevPage();
	Tester.AssertEqual("Current page is 0", pageIndicator.GetPageIndex(), 0);	
	pageIndicator.DoSelectPage(2);
	Tester.AssertEqual("Current page is 2", pageIndicator.GetPageIndex(), 2);
	*/

	var scrollView = SeS('ScrollView');
	scrollView.DoScrollDown();
	scrollView.DoScrollUp();
	scrollView.DoScrollRight();
	scrollView.DoScrollLeft();	
	
	scrollView.DoScrollToElementWithName("Favorites");
	

	var textView = SeS("TextView");
	var text = textView.GetText();
	Tester.Assert("Text starts with 'Lorem'", text.indexOf("Lorem") == 0, text);
	var newText = "Hello World!";
	// Not working (appium fails to clear text before entering
	//textView.SetText(newText);
	Tester.AssertEqual("Text is '" + newText + "'", textView.GetText(), newText);

	var search = SeS("Search");
	search.SetText("pizza");
	Tester.AssertEqual("Text is 'pizza'", search.GetText(), "pizza");
}

function TestHybrid()
{
	Tester.Message("Context is " + iOS.GetContext());
	var ctxs = g_mobileWrapper.GetContexts();
	if (ctxs.length == 2)
	{
		iOS.SetContext(ctxs[1]);
		Tester.Message("Context is " + iOS.GetContext());
		iOS.DoGoToUrl('http://www.libraryinformationsystem.org');
		SeS('Mobile').DoClick();
		iOS.SetContext("NATIVE_APP");
	}
	Tester.Message("Context is " + iOS.GetContext());
}

function TestElement()
{
	var listView = SeS('UIATableView');
	var firstItem = listView.GetChildAt(0);
	Tester.AssertEqual("Label is 'Master - Detail Table View'", firstItem.GetChildAt(0).GetLabel(), "Master - Detail Table View");
	firstItem.DoTap();
	SeS('AUTiOS').DoClick();	
}


/** @scenario TestMasterTable*/
function TestMasterTable()
{
	SeS('Master_Minus_Detail_Table_View').DoClick();
	Global.DoSleep(1000);
	TestTable();
	TestAddRemove();
	SeS('AUTiOS').DoClick();

}

/** @scenario TestBasicControls*/
function TestBasicControls()
{
	SeS('Basic_Controls').DoClick();
	Global.DoSleep(1000);
	iOS.DoScreenshot();
	TestButtonEditLabel();
	TestPicker();
	TestSwitchSliderImage();
	SeS('AUTiOS').DoClick();	

}

/** @scenario TestAdvancedControls*/
function TestAdvancedControls()
{
	SeS('Advanced_Controls').DoClick();
	Global.DoSleep(1000);
	TestAdvControls();
	TestHybrid();	
	SeS('AUTiOS').DoClick();

}
