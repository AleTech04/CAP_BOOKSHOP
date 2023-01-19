using my.bookshop as my from '../db/schema';

service CatalogService @(impl: 'srv/cat-service.js') {
    @Capabilities : { Insertable: true, Updatable: true, Deletable: true }
    entity Books as projection on my.books; 
    entity Authors as projection on my.authors;
    entity Orders as projection on my.orders;
}