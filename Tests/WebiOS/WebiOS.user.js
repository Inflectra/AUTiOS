//Put your custom functions and variables in this file
function TestCreateNewBook()
{
	//Learned a
	Global.DoWaitFor('a');
	SeS('a').DoClick();
	
	Global.DoWaitFor('UserName');
    //Learned input
	SeS('UserName').DoSendKeys("librarian");
	//Learned input
	SeS('Password').DoSendKeys("librarian");
	//Learned input
	SeS('LogIn').DoEnsureVisible();
	SeS('LogIn').DoClick( );

	Global.DoWaitFor('BookManagement');
	//Learned a
	SeS('BookManagement').DoClick();
	
	Global.DoWaitFor('CreateNewBook');
	//Learned a
	SeS('CreateNewBook').DoClick();
	
	Global.DoWaitFor('BookTitle');
	//Learned input
	SeS('BookTitle').DoSendKeys("Poirot Investigates");
	//Learned select
	SeS('BookAuthor').DoSendKeys("Agatha Christie");
	//Learned select
	SeS('BookGenre').DoSendKeys("Science Fiction");
	//Learned input
	SeS('SubmitBook').DoClick( );
	
	Global.DoWaitFor('AddedBook');
	var newBook = SeS('AddedBook');
	Tester.AssertEqual('Book added successfully', newBook.GetText(), "Poirot Investigates");
	
	//Learned a
	SeS('Logout').DoClick( );
}
