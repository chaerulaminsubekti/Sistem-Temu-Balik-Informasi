<?php
//connect to mysql db
    $con = mysql_connect("localhost","root","") or die('Could not connect: ' . mysql_error());
    //connect to the employee database
    mysql_select_db("dbstbi", $con);

    //read the json file contents
    $jsondata = file_get_contents('hm.json');
    
    //convert json object to php associative array
    $data = json_decode($jsondata, true);
	
	//mengambil value array
	$id = $data['posts']['0']['id'];
	$judul = $data['posts']['0']['title'];
	$berita = $data['posts']['0']['content'];
	$id1 = $data['posts']['1']['id'];
	$judul1 = $data['posts']['1']['title'];
	$berita1 = $data['posts']['1']['content'];
	$id2 = $data['posts']['2']['id'];
	$judul2 = $data['posts']['2']['title'];
	$berita2 = $data['posts']['2']['content'];
	$id3 = $data['posts']['3']['id'];
	$judul3 = $data['posts']['3']['title'];
	$berita3 = $data['posts']['3']['content'];
	$id4 = $data['posts']['4']['id'];
	$judul4 = $data['posts']['4']['title'];
	$berita4 = $data['posts']['4']['content'];
	$id5 = $data['posts']['5']['id'];
	$judul5 = $data['posts']['5']['title'];
	$berita5 = $data['posts']['5']['content'];
	$id6 = $data['posts']['6']['id'];
	$judul6 = $data['posts']['6']['title'];
	$berita6 = $data['posts']['6']['content'];
	$id7 = $data['posts']['7']['id'];
	$judul7 = $data['posts']['7']['title'];
	$berita7 = $data['posts']['7']['content'];
	$id8 = $data['posts']['8']['id'];
	$judul8 = $data['posts']['8']['title'];
	$berita8 = $data['posts']['8']['content'];
	$id9 = $data['posts']['9']['id'];
	$judul9 = $data['posts']['9']['title'];
	$berita9 = $data['posts']['9']['content'];

//insert into mysql table
    $sql = "INSERT INTO tbberita(Id, Judul, Berita )
    VALUES('$id', '$judul', '$berita'),
	('$id1', '$judul1', '$berita1'),
	('$id2', '$judul2', '$berita2'),
	('$id3', '$judul3', '$berita3'),
	('$id4', '$judul4', '$berita4'),
	('$id5', '$judul5', '$berita5'),
	('$id6', '$judul6', '$berita6'),
	('$id7', '$judul7', '$berita7'),
	('$id8', '$judul8', '$berita8'),
	('$id9', '$judul9', '$berita9')";
    if(!mysql_query($sql,$con))
    {
        die('Error : ' . mysql_error());
    }
	else{
		echo "Data Sukses Dimasukkan";
	}
?>
<a href="index.php">Kembali Ke Beranda</a>