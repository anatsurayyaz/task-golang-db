update public.accounts 
set "name"='Ana Tsu', balance=7000
where account_id=1;

select * from transaction
join accounts on accounts.account_id = transaction.account_id ;

select * from public.accounts 
WHERE balance = (SELECT MAX(balance) from accounts);

select * from transaction
WHERE EXTRACT(MONTH FROM transaction_date) = 5;


-- public.accounts definition

-- Drop table

-- DROP TABLE public.accounts;

CREATE TABLE public.accounts (
	account_id int8 GENERATED ALWAYS AS IDENTITY NOT NULL,
	"name" varchar NOT NULL,
	balance int8 NOT NULL,
	referral_account_id int8 NULL,
	CONSTRAINT newtable_pk PRIMARY KEY (account_id)
);


-- public.auths definition

-- Drop table

-- DROP TABLE public.auths;

CREATE TABLE public.auths (
	auth_id int8 GENERATED ALWAYS AS IDENTITY NOT NULL,
	account_id int8 NOT NULL,
	username varchar NOT NULL,
	"password" varchar NOT NULL,
	CONSTRAINT auths_pk PRIMARY KEY (auth_id),
	CONSTRAINT auths_unique UNIQUE (account_id),
	CONSTRAINT auths_unique_1 UNIQUE (username)
);


-- public."transaction" definition

-- Drop table

-- DROP TABLE public."transaction";

CREATE TABLE public."transaction" (
	transaction_id int8 GENERATED ALWAYS AS IDENTITY NOT NULL,
	transaction_category_id int8 NULL,
	account_id int8 NULL,
	from_account_id int8 NULL,
	to_account_id int8 NULL,
	amount int8 NULL,
	transaction_date timestamp NULL,
	CONSTRAINT transaction_pk PRIMARY KEY (transaction_id)
);


-- public.transaction_categories definition

-- Drop table

-- DROP TABLE public.transaction_categories;

CREATE TABLE public.transaction_categories (
	transaction_category_id int4 GENERATED ALWAYS AS IDENTITY NOT NULL,
	"name" varchar NULL,
	CONSTRAINT transaction_categories_pk PRIMARY KEY (transaction_category_id)
);
