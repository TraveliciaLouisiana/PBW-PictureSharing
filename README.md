# PBW-Picture-Sharing

## 1. Technology Stack

| Teknologi       | Versi / Keterangan                       |
| --------------- | ---------------------------------------- |
| Java            | 21                                       |
| Spring Boot     | 4.2.x                                    |
| Build Tool      | Gradle Kotlin DSL                        |
| Database        | PostgreSQL                               |
| Database Access | Spring JDBC                              |
| Backend         | Spring MVC                               |
| Frontend        | Thymeleaf, HTML, CSS, Vanilla JavaScript |
| Authentication  | Spring Security                          |
| Validation      | Jakarta Bean Validation                  |

## 2. Prerequisites

Pastikan perangkat sudah memiliki:

- JDK 21 (sesuaikan lagi bisa cek dengan command prompt `javac --version`).
- PostgreSQL.
- Gradle Wrapper (sudah disertakan dalam project).
- Database client seperti DataGrip atau pgAdmin (opsional).

Periksa instalasi Java dan PostgreSQL sebelum menjalankan project.

`javac --version`

`postgres --version`

jika versi java berbeda ubah di build.gradle.kts bagian

````
java {
	toolchain {
		languageVersion = JavaLanguageVersion.of(21)
	}
}
```

### Dependencies

| Dependency               | Fungsi                                   |
| ------------------------ | ---------------------------------------- |
| Spring Web               | Spring MVC dan HTTP request handling     |
| Spring JDBC              | Database access menggunakan JdbcTemplate |
| Spring Security          | Authentication dan authorization         |
| Spring Validation        | Validasi input server-side               |
| Thymeleaf                | Server-side HTML rendering               |
| PostgreSQL Driver        | Koneksi ke PostgreSQL                    |
| Lombok                   | Mengurangi boilerplate Java              |
| Spring Boot DevTools     | Mempermudah development                  |
| Spring Boot Starter Test | Unit testing dan integration testing     |

### 4. application.properties

File ini digunakan untuk menyimpan konfigurasi aplikasi Spring Boot (contoh: nama database lokal).

Lokasi:

`src/main/resources/application.properties`

Konfigurasi yang perlu disiapkan:

| Property                                  | Fungsi                                  |
| ----------------------------------------- | --------------------------------------- |
| spring.application.name                   | Nama aplikasi                           |
| server.port                               | Port aplikasi                           |
| spring.datasource.url                     | URL koneksi PostgreSQL                  |
| spring.datasource.username                | Username PostgreSQL                     |
| spring.datasource.password                | Password PostgreSQL                     |
| spring.datasource.driver-class-name       | PostgreSQL JDBC Driver                  |
| spring.servlet.multipart.max-file-size    | Batas ukuran satu file upload           |
| spring.servlet.multipart.max-request-size | Batas ukuran keseluruhan request upload |
| app.upload.dir                            | Lokasi penyimpanan file upload          |

Sesuaikan nilai koneksi database dengan konfigurasi PostgreSQL lokal masing-masing.

**Security note:**

- Jangan memasukkan password database asli ke repository.
- Jangan menyimpan secret authentication di Git.

## 5. PostgreSQL Local Database Setup

Aplikasi menggunakan PostgreSQL sebagai relational database.

### Step 1 — Pastikan PostgreSQL berjalan

Pastikan PostgreSQL sudah terinstal dan service database sedang aktif.

### Step 2 — Buat database

Sebelum menjalankan aplikasi, pastikan PostgreSQL sudah terinstal dan berjalan di perangkat masing-masing.

1. Setelah database berhasil dibuat, jalankan SQL script yang telah disediakan pada folder `database` di repository ini.
2. Pastikan seluruh tabel berhasil dibuat sebelum menjalankan aplikasi.
3. Sesuaikan konfigurasi koneksi database pada `application.properties` dengan pengaturan PostgreSQL lokal masing-masing.

**Note:** kalo ada perubahan push juga script SQLnya.

### Step 3 — Siapkan database user

Gunakan akun PostgreSQL khusus untuk aplikasi.

Pastikan akun tersebut memiliki izin yang diperlukan untuk mengakses database, membaca data, menambahkan data, memperbarui data, dan menghapus data.

### Step 4 — Hubungkan aplikasi

Sesuaikan konfigurasi datasource pada application.properties dengan database lokal.

Periksa:

- Url PostgreSQL contoh: `spring.datasource.url=jdbc:postgresql://localhost:5432/TubesPBW`
- Port PostgreSQL. default: 5432
- Username postgres lokal contoh: `spring.datasource.username=postgres`
- Password postgres lokal contoh: `spring.datasource.password=postgres123*`

## 5. Project Directory Structure

Struktur awal project yang direkomendasikan:

    picture-sharing/
    │
    ├── gradle/
    ├── gradlew
    ├── gradlew.bat
    ├── build.gradle.kts
    ├── settings.gradle.kts
    │
    ├── src/
    │   │
    │   ├── main/
    │   │   │
    │   │   ├── java/
    │   │   │   └── com/example/picturesharing/
    │   │   │       ├── config/
    │   │   │       ├── controller/
    │   │   │       ├── service/
    │   │   │       ├── repository/
    │   │   │       ├── model/
    │   │   │       ├── dto/
    │   │   │       ├── exception/
    │   │   │       └── PictureSharingApplication.java
    │   │   │
    │   │   └── resources/
    │   │       ├── templates/
    │   │       │   ├── fragments/
    │   │       │   ├── home/
    │   │       │   ├── auth/
    │   │       │   ├── gallery/
    │   │       │   ├── collection/
    │   │       │   └── admin/
    │   │       │
    │   │       ├── static/
    │   │       │   ├── css/
    │   │       │   ├── js/
    │   │       │   └── images/
    │   │       │
    │   │       └── application.properties
    │   │
    │   └── test/
    │       └── java/
    │
    ├── uploads/
    │   └── images/
    │
    └── .gitignore

### 6.1 src/main/java

| Package    | Tanggung jawab                             |
| ---------- | ------------------------------------------ |
| config     | Konfigurasi aplikasi dan Spring Security   |
| controller | Menerima request dan mengatur response     |
| service    | Menangani business logic                   |
| repository | Mengakses database menggunakan Spring JDBC |
| model      | Merepresentasikan objek/domain aplikasi    |
| dto        | Objek untuk pertukaran data                |
| exception  | Penanganan exception dan error             |

Struktur ini merupakan rekomendasi awal. Package dapat dikembangkan sesuai kebutuhan aplikasi.

### 6.2 src/main/resources/templates

Tempat menyimpan halaman HTML yang dirender oleh Thymeleaf.

Rekomendasi pembagian:

| Folder     | Isi                                                           |
| ---------- | ------------------------------------------------------------- |
| fragments  | Komponen HTML yang digunakan ulang, seperti navbar dan footer |
| home       | Homepage dan halaman informasi                                |
| auth       | Login dan register                                            |
| gallery    | Explore dan detail gambar                                     |
| collection | Saved dan personal collection                                 |
| admin      | Dashboard dan halaman administrasi                            |

### 6.3 src/main/resources/static

Tempat menyimpan aset frontend yang disajikan sebagai file statis.

| Folder | Isi                                                    |
| ------ | ------------------------------------------------------ |
| css    | Stylesheet aplikasi                                    |
| js     | Vanilla JavaScript                                     |
| images | Aset visual bawaan website, seperti logo dan ilustrasi |

Jangan menyimpan gambar hasil upload pengguna di folder ini.

### 6.4 src/test

Pengujian dapat mencakup:

- Validasi input.
- Authentication dan authorization.
- Operasi CRUD.
- Database access.
- Pengelolaan file upload.

### 6.5 uploads

Tempat penyimpanan gambar yang diunggah oleh pengguna.

File disimpan di local file storage, sedangkan PostgreSQL menyimpan metadata dan lokasi file.

Folder ini harus tetap tersedia ketika aplikasi diperbarui atau dijalankan kembali.

Jangan menyimpan file upload pengguna ke Git.

## 7. Running the Application

### Step 1 — Clone repository

Clone repository kelompok ke komputer lokal.

### Step 2 — Buka project

### Step 3 — Konfigurasi database

Pastikan PostgreSQL berjalan dan application.properties sudah disesuaikan dengan konfigurasi lokal.

### Step 4 — Siapkan folder upload

Pastikan direktori upload sudah tersedia dan aplikasi memiliki izin untuk membaca serta menulis file di dalamnya.

### Step 5 — Jalankan aplikasi

Windows PowerShell:

    .\gradlew.bat bootRun

Linux / macOS:

    ./gradlew bootRun

### Step 6 — Akses website

Buka browser dan akses:

    http://localhost:8080

Jika aplikasi menggunakan port berbeda, sesuaikan URL dengan konfigurasi server.

## 9. Development Guidelines

1. Gunakan Gradle Wrapper yang tersedia di repository.
2. Jangan mengubah versi dependency tanpa koordinasi.
3. Jangan menggunakan Spring Data maupun JPA.
4. Gunakan Spring JDBC untuk operasi database.
5. Gunakan Vanilla JavaScript.
6. Jangan menambahkan CSS framework/library tambahan.
7. Jangan memasukkan file upload pengguna ke repository.
8. Jangan melakukan commit terhadap credential atau secret.
9. Dokumentasikan perubahan konfigurasi dan database.
10. Lakukan commit secara berkala pada branch masing-masing.

## 10. References

- Spring Initializr: https://start.spring.io/
- Spring Boot Documentation: https://docs.spring.io/spring-boot/3.5/
- Spring JDBC: https://docs.spring.io/spring-framework/reference/data-access/jdbc.html
- Spring Security: https://docs.spring.io/spring-security/reference/
- Thymeleaf: https://www.thymeleaf.org/documentation.html
- PostgreSQL Documentation: https://www.postgresql.org/docs/
- Gradle Documentation: https://docs.gradle.org/current/userguide/userguide.html

---

**Project:** Picture Sharing

**Database:** PostgreSQL

**Backend:** Spring Boot

**Frontend:** Thymeleaf, HTML, CSS, Vanilla JavaScript
````
