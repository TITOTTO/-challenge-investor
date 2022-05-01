## Hello, welcome to our "soon to be millionaire" Application.  
## We are scamming our clients, free of charge.  

1. We'd like you to add validations on the client input. 
   - Some data from our clients is not correct, please consult "Data requirements"

2. We want the Manager to handle errors
   - We need to be aware of errors to inform our clients ASAP.
   - Please add a #errors method on `Manager` to display all errors which happened investing.

4. We'd like you to upgrade our system so our scamming grows international !!
   - Our new client send their data in a new format (JSON) (~./new_clients/*.json)
   - Our previous client still use their own format (CSV), be careful.


Data Requirements:
- Our Clients have a 4 letter ID
- Risk must be >= 1
- Risk must be <= 15
- Duration must be >= 1
- Amount must be >= 1_000

`Manager` is our main Class  
It calls all the other Classes to make the investments and display the results  

`Client` helps us to store and use our client data during our investment phase  
`Account` helps us to store the losses and profits during our investment phase  
`Casino` is basically our investment tool. Sometimes you win, sometimes you loose  
`CsvReader` is used to read data Accounting sends us
`CsvWriter` is used to format our data before sending it to Accounting

_____

To Invest, you can use a very simple script we have: `ruby bin/script.rb`
