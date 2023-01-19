//using my.bookshop as stats from '../db/schema'; //before
using my.bookshop from '../db/schema';               //after

service Stats{
 @readonly 
 //entity OrderInfo as projection on stats.orders excluding {  //before
 entity OrderInfo as projection on bookshop.orders excluding { //after
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy,
    book
 }
}