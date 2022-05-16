CREATE TABLE Fakultas (
	id_fakultas varchar(45) NOT NULL,
	nama_fakultas varchar(45) NOT NULL,
	PRIMARY KEY (id_fakultas)
);

CREATE TABLE Jurusan (
	id_jurusan varchar(45) NOT NULL,
	nama_jurusan varchar(45) NOT NULL,
	id_fakultas varchar(45) NOT NULL,
	PRIMARY KEY (id_jurusan)
);

CREATE TABLE Mahasiswa (
	NIM varchar(45) NOT NULL, 
	nama varchar(45) NOT NULL, 
	tgl_lahir DATE NOT NULL, 
	email varchar(45) NOT NULL, 
	no_hp varchar(45) NOT NULL,
    alamat varchar(45) NOT NULL,
	id_jurusan varchar(45) NOT NULL,
	PRIMARY KEY (NIM)
);

CREATE TABLE Checkin (
	NIM varchar(45) NOT NULL,
	tgl_checkin DATE NOT NULL,
	PRIMARY KEY (NIM)
);

CREATE TABLE Penghuni (
	NIM varchar(45) NOT NULL,
	no_kamar NUMBER NOT NULL,
	no_gedung NUMBER NOT NULL,
	PRIMARY KEY (NIM)
);

CREATE TABLE Checkout (
	NIM varchar(45) NOT NULL,
	tgl_checkout DATE NOT NULL,
	PRIMARY KEY (NIM)
);

CREATE TABLE Kamar (
	no_kamar NUMBER NOT NULL,
	lantai NUMBER NOT NULL,
	PRIMARY KEY (no_kamar)
);

CREATE TABLE Gedung (
	no_gedung NUMBER NOT NULL,
	nama_gedung varchar(45) NOT NULL,
	jenis varchar(45) NOT NULL,
	PRIMARY KEY (no_gedung)
);

CREATE TABLE Staff (
	id_staff varchar(20) NOT NULL,
	nama_staff varchar(45) NOT NULL,
	id_jabatan varchar(20) NOT NULL,
	no_gedung NUMBER NOT NULL,
	PRIMARY KEY (id_staff)
);

CREATE TABLE Jabatan (
	id_jabatan varchar(20) NOT NULL,
	nama_jabatan varchar(45) NOT NULL,
	gaji NUMBER NOT NULL,
	PRIMARY KEY (id_jabatan)
);

CREATE TABLE Pelanggaran (
	id_pelanggaran varchar(20) NOT NULL,
	tgl_pelanggaran DATE NOT NULL,
	jenis_pelanggaran varchar(45) NOT NULL,
	keterangan varchar(45) NOT NULL,
	NIM varchar(45) NOT NULL,
	NIP varchar(45) NOT NULL,
	PRIMARY KEY (id_pelanggaran)
);

CREATE TABLE Kemahasiswaan (
	NIP varchar(45) NOT NULL,
	nama varchar(45) NOT NULL,
	PRIMARY KEY (NIP)
);

ALTER TABLE Jurusan ADD CONSTRAINT Jurusan_fk1 FOREIGN KEY (id_fakultas) REFERENCES Fakultas(id_fakultas);

ALTER TABLE Mahasiswa ADD CONSTRAINT Mahasiswa_fk1 FOREIGN KEY (id_jurusan) REFERENCES Jurusan(id_jurusan);

ALTER TABLE Checkin ADD CONSTRAINT Checkin_fk1 FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM);

ALTER TABLE Penghuni ADD CONSTRAINT Penghuni_fk1 FOREIGN KEY (NIM) REFERENCES Checkin(NIM);

ALTER TABLE Penghuni ADD CONSTRAINT Penghuni_fk2 FOREIGN KEY (no_kamar) REFERENCES Kamar(no_kamar);

ALTER TABLE Penghuni ADD CONSTRAINT Penghuni_fk3 FOREIGN KEY (no_gedung) REFERENCES Gedung(no_gedung);

ALTER TABLE Checkout ADD CONSTRAINT Checkout_fk1 FOREIGN KEY (NIM) REFERENCES Penghuni(NIM);

ALTER TABLE Staff ADD CONSTRAINT Staff_fk1 FOREIGN KEY (id_jabatan) REFERENCES Jabatan(id_jabatan);

ALTER TABLE Staff ADD CONSTRAINT Staff_fk2 FOREIGN KEY (no_gedung) REFERENCES Gedung(no_gedung);

ALTER TABLE Pelanggaran ADD CONSTRAINT Pelanggaran_fk1 FOREIGN KEY (NIM) REFERENCES Penghuni(NIM);

ALTER TABLE Pelanggaran ADD CONSTRAINT Pelanggaran_fk2 FOREIGN KEY (NIP) REFERENCES Kemahasiswaan(NIP);

