namespace my.bookshop;

using {cuid, managed} from '@sap/cds/common';

entity books {
    key ID: Integer;
    title: String;
    stock: Integer;
    author: Association to authors;
}

entity authors {
    key ID: Integer;
    name: String;
    books: Association to many books on books.author = $self;
}

entity orders : cuid, managed {
    book: Association to books;
    quantity: Integer;
}
