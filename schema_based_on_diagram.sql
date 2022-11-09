CREATE table patients (
    id serial not null primary key,
    name varchar(255) not null,
    date_of_birth date not null
);

create table medical_histories(
    id serial not null primary key,
    admitted_at timestamp not null,
    patient_id int not null references patients(id),
   status varchar(255) not null
);



create table treatments(
    id serial not null primary key,
  type varchar (255) not null,
  name varchar(255) not null,
);

create table invoices(
    id serial not null primary key,
    total_amount int not null,
    generated_at timestamp not null,
    payed_at timestamp not null,
    medical_history_id int not null references medical_histories(id)
);

create table invoice_items(
    id serial not null primary key,
    unit_price decimal not null,
   quantity int not null,
    invoice_id int not null references invoices(id),
    treatment_id int not null references treatments(id)
);
/* many to many table */
 create table medical_history_details(
    id serial not null primary key,
    medical_history_id int not null references medical_histories(id),
    treatmnets_id int not null references treatments(id),
    description varchar(255) not null,
   
); 


/* Create Index */
CREATE INDEX medical_histories_patient_id_idx ON medical_histories(patient_id);
CREATE INDEX invoices_medical_history_id_idx ON invoices(medical_history_id);   
CREATE INDEX invoice_items_invoice_id_idx ON invoice_items(invoice_id); 
CREATE INDEX invoice_items_treatment_id_idx ON invoice_items(treatment_id);

CREATE INDEX medical_history_details_medical_history_id_idx ON medical_history_details(medical_history_id);