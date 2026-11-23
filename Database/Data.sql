CREATE DATABASE TubesPBW;

-- check database
SELECT datname
FROM pg_database
ORDER BY datname;

CREATE TABLE users (
    id_user INTEGER not null GENERATED ALWAYS AS IDENTITY,
    name varchar(100) not null,
    email varchar(255) not null,
    pass varchar(255) not null,
    constraint pk_user PRIMARY KEY (id_user),
    CONSTRAINT users_email_unique UNIQUE (email)
);

CREATE TABLE pengguna(
    id_user INTEGER PRIMARY KEY,
    constraint fk_pengguna
        foreign key (id_user)
        REFERENCES users(id_user)
        on delete cascade
);

create table admin(
  id_user INTEGER primary key,
  constraint fk_admin
    foreign key (id_user)
    references users(id_user)
    on delete cascade
);
create table gambar(
    id_gambar INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    id_pengguna INTEGER not null,
    deskripsi varchar(120),
    image_url varchar(500),
    file_size BIGINT,
    uploaded_at timestamptz default current_timestamp,
    constraint fk_gambar
        FOREIGN KEY (id_pengguna)
        references pengguna(id_user)
        on delete cascade
);

create table tag(
    id_tag INTEGER primary key generated always as identity,
    nama_tag varchar(255) not null
);

CREATE TABLE tag_mapping(
    id_gambar INTEGER,
    id_tag INTEGER,
    constraint fk_gambar
        foreign key (id_gambar)
        references gambar(id_gambar)
        on delete cascade,
    constraint fk_tag
        foreign key (id_tag)
        references tag(id_tag)
        on delete cascade,
    CONSTRAINT pk_collection_gambar
    PRIMARY KEY (id_tag, id_gambar)
);

create table collection(
    id_list INTEGER primary key generated always as IDENTITY,
    id_pengguna INTEGER not null,
    nama_list varchar(255) not null,
    deskripsi_list varchar(255) not null,
    created_at timestamptz default current_timestamp,
    constraint fk_pengguna
        foreign key (id_pengguna)
        references pengguna(id_user)
        on delete cascade
);
create table collection_gambar(
    id_collection INTEGER not null,
    id_gambar INTEGER not null,
    saved_at timestamptz default current_timestamp,
    CONSTRAINT pk_collection_gambar
        PRIMARY KEY (id_collection, id_gambar),
    constraint fk_koleksi
        foreign key (id_collection)
        references collection(id_list)
        on delete cascade,
    constraint fk_gambar
        foreign key (id_gambar)
        references gambar(id_gambar)
        on delete cascade
);

create table laporan(
    id_laporan INTEGER generated always as IDENTITY,
    id_pengguna INTEGER not null,
    id_gambar INTEGER not null,
    kategori_laporan varchar(50) not null,
    deskripsi_laporan varchar(500),
    status varchar(20) not null,
    created_at timestamptz default current_timestamp,
    constraint pk_laporan
        primary key (id_laporan),
    constraint fk_pengguna
        foreign key (id_pengguna) references pengguna(id_user) on delete cascade,
    constraint fk_gambar
        foreign key (id_gambar) references gambar(id_gambar) on delete cascade,
    CONSTRAINT uniqLaporan UNIQUE (id_gambar, id_pengguna),
    CONSTRAINT jenis_status CHECK (status in('pending', 'selesai'))
);

create table log_laporan(
    id_log integer primary key generated always as identity,
    id_admin integer not null,
    id_laporan integer not null,
    action varchar(30) not null ,
    created_at timestamptz default current_timestamp,
    constraint fk_admin
        foreign key (id_admin)
        references admin(id_user)
        on delete cascade,
    constraint fk_laporan
        foreign key (id_laporan)
        references laporan(id_laporan)
        on delete cascade ,
    CONSTRAINT jenis_action CHECK (action in('hapus', 'tidak hapus')),
    CONSTRAINT id_lapor UNIQUE (id_laporan)
);



