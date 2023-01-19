module.exports = (srv) => {
    console.log('Service name: ${srv.name} is served at ${srv.path}')

    const {Books} = cds.entities('my.bookshop')

    srv.after('READ', 'Books', xs =>{
        console.log(xs);

        const newBooks= [];
        xs.forEach(x => {
            if(x.stock > 500){
                x.title = '10% discount' + x.title;
            }
            newBooks.push(x);
        });
       // if(xs.stock >500){
        //    xs.title = '10% discount' + xs.title;
       // }
        return newBooks;
    })

    // Reduce stock of ordered books
    srv.after('CREATE', 'Orders', async (req) => {
        console.log(req);
        //const order = req.data;
        if (req.quantity > 11)  throw 'Order quantity must not exceed 11'
        //if (!req.quantity || req.quantity <= 0)  return req.error (400, 'Order at least 1 book')
        //const tx = cds.transaction(req)
        //const affectedRows = await tx.run (
        //UPDATE (Books)
        //    .set   ({ stock: {'-=': order.quantity}})
        //    .where ({ stock: {'>=': order.quantity},/*and*/ ID: order.book_ID})
        //)
        //if (affectedRows === 0)  req.error (409, "Sold out, sorry")
    })

    

}