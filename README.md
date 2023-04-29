# Analyzing eCommerce Business Performance with SQL: Project Overview
- Berperan sebagai anggota dari tim **Data Analytics** di sebuah perusahaan eCommerce untuk menganalisis tiga aspek yang berkaitan dengan performa bisnis perusahaan tersebut.
- Terdapat 8 dataset berekstensi *csv* [here](https://github.com/bumianugrahhh/Analyzing_eCommerce/tree/master/Dataset)
- Membuat Entity Relationship Diagram (ERD) dengan PgAdmin4 dan mengekspor dalam bentuk [gambar](https://github.com/bumianugrahhh/Analyzing_eCommerce/blob/master/Fig/ERD%20-%20eCommerce.pgerd.png)
- Membuat database baru beserta tabel-tabelnya
- Menganalisa Pertumbuhan Aktivitas Pelanggan Tahunan
- Menganalisa Kualitas Kategori Produk Tahunan
- Melakukan visualisasi data dengan **Tableau** dan **Microsoft PowerPoint**

## Latar belakang 
Perusahaan ini merupakan salah satu marketplace terbesar di Amerika Selatan yang menghubungkan pelaku bisnis mikro dengan para pelanggannya. Dalam suatu perusahaan mengukur performa bisnis sangatlah penting untuk melacak, memantau, dan menilai keberhasilan atau kegagalan dari berbagai proses bisnis. 

## Tujuan
Menganalisa performa bisnis untuk sebuah perusahan eCommerce, dengan memperhitungkan beberapa metrik bisnis yaitu **pertumbuhan pelanggan**, **kualitas produk** dan **tipe pembayaran**.


# Insight/Analisis
1. Setiap tahunnya aktivitas customer bulanan (MAU) dan customer baru mengalami peningkatan, hanya saja pada tahun 2016 memiliki perbedaan yang sangat signifikan dengan tahun 2017 dan 2018, dikarenakan data yang tersedia dimulai pada bulan September 2016. <br><br>
![alt text](https://github.com/bumianugrahhh/Analyzing_eCommerce/blob/master/Fig/Increase%20of%20Average%20MAU%20and%20New%20Customer.png)

2. Dari tahun 2017 ke tahun 2018 customer yang melakukan repeat order mengalami penurunan. Jika dibandingan dengan customer baru yang mengalami peningkatan tiap tahunnya, itu berarti rata-rata order yang dilakukan customer hanya sekali saja sepanjang tahun <br><br>
![alt text](https://github.com/bumianugrahhh/Analyzing_eCommerce/blob/master/Fig/Decrease%20in%20Repeat%20Customer.png)

3. Dari analisi ini, terlihat bahwa setiap tahunnya jumlah revenue terus meningkat dan category product yang menjadi best seller atau yang memberikan revenue terbanyak berbeda-beda pula setiap tahunnya. <br><br>
![alt text](https://github.com/bumianugrahhh/Analyzing_eCommerce/blob/master/Fig/Top%20Product.png)

4. Sama halnya dengan revenue, total canceled mengalami peningkatan setiap tahunnya. <br>
Begitu pula dengan kategori produk dengan jumlah cancel order terbanyak setiap tahunnya mengalami perubahan. <br><br> 
![alt text](https://github.com/bumianugrahhh/Analyzing_eCommerce/blob/master/Fig/Most%20Cancelled.png)

5. Ditahun 2018 terlihat bahwa yang memberikan revenue tertinggi dan jumlah cancel order terbanyak memiliki kesamaan kategori produk yakni Health Beauty. Dapat dilakukan analisis lebih lanjut untuk hal ini. <br><br>
![alt text](https://github.com/bumianugrahhh/Analyzing_eCommerce/blob/master/Fig/Annual%20Product%20Category%20Quality%20Analysis.png)

6. Terlihat bahwa sebagian besar customer melakukan pembayaran menggunakan credit card. <br>
Selain itu, untuk tipe pembayaran debit card mengalami peningkatan penggunaan yang sangat signifikan dari tahun 2017 ke 2018 <br>
Akan tetapi disis lain, customer yang menggunkan voucher untuk pembayaran mengalami penurunan. <br><br>
![alt text](https://github.com/bumianugrahhh/Analyzing_eCommerce/blob/master/Fig/Payment%20Type.png)





