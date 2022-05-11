import 'dart:io';
import 'morse.dart';

//global declaration
var BookDetails = new Map(); //Map for ISBN : Book Object
var isbn = []; //NO. of ISBN
var bookCount = 0; //Total NO. of Books
var userDetails = new Map(); //Map for customer USERNAME : customerObject
var USERNAME = []; //
var userCount = 0; //Total Number of Customer

class Books {
  var title, author, isbn;
  var Genre = " ";
  List genre = [
    {'genre': 'Computer Science'},
    {'genre': 'Philosophy'},
    {'genre': 'Pure Science'},
    {'genre': 'Art and Recreation'},
    {'genre': 'History'}
  ];

  //For adding books that has been initialized!!
  //initialized book title
  Future<void> bookTitle(title) async {
    title = stdin.readLineSync();
    return title;
  }

  //initialized book author
  Future<void> bookAuthor(author) async {
    author = stdin.readLineSync();
    return author;
  }

  //initialized unique ISBN
  Future<void> bookISBN(isbn) async {
    isbn = stdin.readLineSync();
    return isbn;
  }

  void addBook() {
    print("Title: ");
    bookTitle(title);
    print("Author: ");
    bookAuthor(author);

    do {
      print("Genre: ");
      Genre = stdin.readLineSync()!;
    } while (!genre.contains(Genre));
  }
}

display() {
  bool available;
  available = true;
  Book tit = new Book();
  tit.addBook();
  print(tit.Title + " lll " + tit.Author + " lll " + tit.Genre);
  if (available == true) {
    print('Status ---- Available');
  } else {
    print('Status ---- Borrowed');
  }
}

class user {
  var name, Address, bookBorrowed = [];

  Future<void> bookborrow() async {
    bookBorrowed.forEach((borrow) {
      print(BookDetails[borrow] + " ");
    });
  }

  //initializerd user's name
  Future<void> fullName(name) async {
    name = stdin.readLineSync();
    return name;
  }

  //initialized user's address
  Future<void> address(Address) async {
    Address = stdin.readLineSync();
    return Address;
  }

  Future<void> addCustomer() async {
    print('Name: ');
    fullName(name);
    print('Address: ');
    address(Address);
  }

  Future<void> display() async {
    print('Name: ' + name);
    print('Address: ' + Address);
    print('Books: ');
    bookborrow();
  }
}

void choice1() {
  var temp = " ";
  print('Enter ISBN : ');
  temp = stdin.readLineSync()!;
  if (ISBN.contains(temp)) {
    print("That ISBN already Exist in the library");
  } else {
    ISBN.add(temp);
    Book chi = new Book();
    chi.addBook();
    BookDetails[temp] = chi;
    bookCount++;
    print(chi.Title + "has succesfully added to the system ");
  }
}

void choice2() {
  print("All Books: ");
  for (var i = 0; i < bookCount; i++) {
    print(ISBN[i] + " lll ");
    BookDetails[ISBN[i]].display();
  }
}

void choice3() {
  print("Available Books");
  for (var i = 0; i < bookCount; i++) {
    if (BookDetails[ISBN[i]].available == true) {
      BookDetails[ISBN[i]].display();
    }
  }
}

void choice4() {
  print("Borrowed Books: ");
  for (var i = 0; i < bookCount; i++) {
    if (BookDetails[ISBN[i]].available == false) {
      BookDetails[ISBN[i]].display();
    }
  }
}

void choice5() {
  var temp;
  print("Enter Username : ");
  temp = stdin.readLineSync()!;
  if (USERNAME.contains(temp)) {
    print("That Username already Exist");
  } else {
    USERNAME.add(temp);
    user u = new user();
    u.addCustomer();
    CustomerDetails[temp] = u;
    customerCount++;
    print("$temp has been Added to the system");
  }
}

void choice6() {
  for (var i = 0; i < customerCount; i++) {
    CustomerDetails[USERNAME[i]].display();
  }
}

void main(List<String> args) {
  print("!WELCOME TO LIBRARY SYSTEM!");
  print(
      'Genres: Computer Science, Philosophy, Pure Science, History, Art and Recreation');
  print("[1]--ADD BOOK!");
  print("[2]--ALL BOOK AVAILABLE!");
  print("[3]--BOOK BORROWED!");
  print("[4]--BOOK AVAILABLE!");
  print("[5]--ADD USER!");
  print("[6]--ALL USER!");
  print("[7]--BORROW A BOOK");
  print("[0]--QUIT");

  for (;;) {
    var n;
    n = stdin.readLineSync();

    switch (n) {
      case '1': //ADD BOOK
        choice1();
        break;
      case '2': //ALL BOOK AVAILABLE
        choice2();
        break;
      case '3': //BOOK BORROWED
        choice3();
        break;
      case '4': //BOOK AVAILABLE
        choice4();
        break;
      case '5': //ADD USER
        choice5();
        break;
      case '6': //ALL USER
        choice6();
        break;
      case '7': //BORROW A BOOK
        var tempUsername = " ";
        print("Enter Username : ");
        tempUsername = stdin.readLineSync()!;
        if (!USERNAME.contains(tempUsername)) {
          print("Username doesn't Exist, add customer or review username");
          continue;
        }
        var tempISBN = " ";
        print("Enter ISBN : ");
        tempISBN = stdin.readLineSync()!;
        if (!ISBN.contains(tempISBN)) {
          print("Book doesn't Exist, add book or review ISBN");
          continue;
        }

        BookDetails[tempISBN].available = false;
        CustomerDetails[tempUsername].BorrowedBooks.add(tempISBN);
        break;
    }

    /*
    if (n == 1) {
      //add book
      choice1();
    } else if (n == 2) {
      //determine if the book is available
      choice2();
    } else if (n == 3) {
      //Books that has been rented
      choice3();
    } else if (n == 4) {
      //Books that still available
      choice4();
    } else if (n == 5) {
      //to add user to the system
      choice5();
    } else if (n == 6) {
      //Display all user to the system
      choice6();
    } else if (n == 7) {
      var tempUsername = " ";
      print("Enter Username : ");
      tempUsername = stdin.readLineSync()!;
      if (!USERNAME.contains(tempUsername)) {
        print("Username doesn't Exist, add customer or review username");
        continue;
      }
      var tempISBN = " ";
      print("Enter ISBN : ");
      tempISBN = stdin.readLineSync()!;
      if (!ISBN.contains(tempISBN)) {
        print("Book doesn't Exist, add book or review ISBN");
        continue;
      }

      BookDetails[tempISBN].available = false;
      CustomerDetails[tempUsername].BorrowedBooks.add(tempISBN);
    }
    */
    if (n == 0) break;
  }
}
