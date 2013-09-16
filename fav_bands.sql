CREATE TABLE bands (
					id serial primary key,
					band_name text,
					num_albums integer,
					lead_singer varchar(101),
					grammy_won boolean 
					);

CREATE TABLE band_members (
					id serial primary key,
					name varchar(101),
					age varchar(3),
					band_id serial,
					FOREIGN KEY (band_id)
					REFERENCES bands(id)
);



