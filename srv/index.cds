using from './catalog-service';

annotate CatalogService.Books with @(
    UI: {
        Identification : [ {Value: title} ],
        SelectionFields : [title],
        LineItem  : [
            {Value: ID},
            {Value: title},
            {Value: author.name},
            {Value: stock}
        ],
        HeaderInfo : {
            TypeName: '{i18n>Books}',
            TypeNamePlural: '{i18n>Books}',
            Title: {Value: title},
            Description: {Value: author.name}
        }
    }
);

annotate CatalogService.Orders with @(
    UI: {
        Identification : [ {Value: '{i18n>Books}'} ],
        SelectionFields : [createdBy],
        LineItem  : [
            {Value: createdBy},
            {Value: createdAt},
            {Value: book.ID},
            {Value: book.title},
            {Value: quantity}
        ],
        HeaderInfo : {
            TypeName: '{i18n>Book}',
            TypeNamePlural: '{i18n>Books}',
            Title: {Value: book.title},
            Description: {Value: quantity}
        }
    }
);

annotate CatalogService.Books with{
    ID @title : '{i18n>ID}' @UI.HiddenFilter;
    title @title: '{i18n>Title}';
    author @title: '{i18n>Author}';
    stock @title: '{i18n>Stock}';
}

annotate CatalogService.Authors with{
    ID @title : '{i18n>ID}' @UI.HiddenFilter;
    name @title: '{i18n>AuthorName}';
}

annotate CatalogService.Orders with{
    createdBy @title : '{i18n>createdBy}';
    //modifiedBy @title : '{i18n>modifiedBy}' @UI.HiddenFilter;
    book @title: '{i18n>Title}';
    createdAt;
    quantity @title: '{i18n>quantity}';
}



