update public.accounts 
set "name"='Ana Tsu', balance=7000
where account_id=1;

select * from transaction
join accounts on accounts.account_id = transaction.account_id ;

select * from public.accounts 
WHERE balance = (SELECT MAX(balance) from accounts);

select * from transaction
WHERE EXTRACT(MONTH FROM transaction_date) = 5;