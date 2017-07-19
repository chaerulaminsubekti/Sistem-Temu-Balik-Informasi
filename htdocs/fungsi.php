<?php
//=============== koleksi fungsi ===================
//fungsi untuk melakukan preprocessing terhadap teks
//terutama stopword removal dan stemming
//--------------------------------------------------------------------------------------------
function preproses($teks) {
  			
  	//bersihkan tanda baca, ganti dengan space
	$teks = str_replace("'", " ", $teks);
	$teks = str_replace("-", " ", $teks);
	$teks = str_replace(")", " ", $teks);
	$teks = str_replace("(", " ", $teks);
	$teks = str_replace("\"", " ", $teks);
	$teks = str_replace("/", " ", $teks);
	$teks = str_replace("=", " ", $teks);
	$teks = str_replace(".", " ", $teks);
	$teks = str_replace(",", " ", $teks);
	$teks = str_replace(":", " ", $teks);
	$teks = str_replace(";", " ", $teks);
	$teks = str_replace("!", " ", $teks);
	$teks = str_replace("?", " ", $teks);
			
	//ubah ke huruf kecil			
	$teks = strtolower(trim($teks));
			
	//terapkan stop word removal
	$astoplist = array ("yang", "juga", "dari", "dia", "kami", "kamu", "ini", "itu",
				 "atau", "dan", "tersebut", "pada", "dengan", "adalah", "yaitu", "ke");						
	foreach ($astoplist as $i => $value) {
   	$teks = str_replace($astoplist[$i], "", $teks);
	}
			
	//terapkan stemming
	//buka tabel tbstem dan bandingkan dengan berita			
	$restem = mysql_query("SELECT * FROM tbstem ORDER BY Id");

	while($rowstem = mysql_fetch_array($restem)) {  			
  		$teks = str_replace($rowstem['Term'], $rowstem['Stem'], $teks);
  	}			 	
	
	//kembalikan teks yang telah dipreproses	
	$teks = strtolower(trim($teks));
	return $teks;
} //end function preproses
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
//fungsi untuk membuat index
function buatindex() {
		//hapus index sebelumnya
		mysql_query("TRUNCATE TABLE tbindex");

		//ambil semua berita (teks)		
		$resBerita = mysql_query("SELECT * FROM tbberita ORDER BY Id");
		$num_rows = mysql_num_rows($resBerita);
		print("Mengindeks sebanyak " . $num_rows . " berita. <br />");

		while($row = mysql_fetch_array($resBerita)) {  			
			$docId = $row['Id'];  
			$berita = $row['Berita'];  
  			
			//terapkan preprocessing  			
  			$berita = preproses($berita);
  			
  			//simpan ke inverted index (tbindex)
  			$aberita = explode(" ", trim($berita));
  			
  			foreach ($aberita as $j => $value) {				
				//hanya jika Term tidak null atau nil, tidak kosong				
				if ($aberita[$j] != "") {				
			 	
					//berapa baris hasil yang dikembalikan query tersebut?					
					$rescount = mysql_query("SELECT Count FROM tbindex WHERE Term = '$aberita[$j]' AND DocId = $docId");			
					$num_rows = mysql_num_rows($rescount);
				
					//jika sudah ada DocId dan Term tersebut	, naikkan Count (+1)			
					if ($num_rows > 0) {					
						$rowcount = mysql_fetch_array($rescount);							
						$count = $rowcount['Count'];
						$count++;
  										
						mysql_query("UPDATE tbindex SET Count = $count WHERE Term = '$aberita[$j]' AND DocId = $docId");
					} 
					//jika belum ada, langsung simpan ke tbindex			
					else {				
						mysql_query("INSERT INTO tbindex (Term, DocId, Count) VALUES ('$aberita[$j]', $docId, 1)");
					}
				} //end if
			} //end foreach			
  		} //end while
} //end function buatindex()
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
//fungsi hitungbobot, menggunakan pendekatan tf.idf
function hitungbobot() {	
	//berapa jumlah DocId total?, n
	$resn = mysql_query("SELECT DISTINCT DocId FROM tbindex");
	$n = mysql_num_rows($resn);
	
	//ambil setiap record dalam tabel tbindex
	//hitung bobot untuk setiap Term dalam setiap DocId
	$resBobot = mysql_query("SELECT * FROM tbindex ORDER BY Id");
	$num_rows = mysql_num_rows($resBobot);
	print("Terdapat " . $num_rows . " Term yang diberikan bobot. <br />");

	while($rowbobot = mysql_fetch_array($resBobot)) {
		//$w = tf * log (n/N)
		$term = $rowbobot['Term'];		
		$tf = $rowbobot['Count'];
		$id = $rowbobot['Id'];
		
		//berapa jumlah dokumen yang mengandung term tersebut?, N
		$resNTerm = mysql_query("SELECT Count(*) as N FROM tbindex WHERE Term = '$term'");
		$rowNTerm = mysql_fetch_array($resNTerm);
		$NTerm = $rowNTerm['N'];
		
		$w = $tf * log($n/$NTerm);
		
		//update bobot dari term tersebut
		$resUpdateBobot = mysql_query("UPDATE tbindex SET Bobot = $w WHERE Id = $id");		
  	} //end while $rowbobot   
} //end function hitungbobot
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
//fungsi panjangvektor, jarak euclidean
//akar(penjumlahan kuadrat dari bobot setiap Term)
function panjangvektor() {	
	//hapus isi tabel tbvektor
	mysql_query("TRUNCATE TABLE tbvektor");
		
	//ambil setiap DocId dalam tbindex
	//hitung panjang vektor untuk setiap DocId tersebut
	//simpan ke dalam tabel tbvektor
	$resDocId = mysql_query("SELECT DISTINCT DocId FROM tbindex");
	
	$num_rows = mysql_num_rows($resDocId);
	print("Terdapat " . $num_rows . " dokumen yang dihitung panjang vektornya. <br />");
	
	while($rowDocId = mysql_fetch_array($resDocId)) {
		$docId = $rowDocId['DocId'];
	
		$resVektor = mysql_query("SELECT Bobot FROM tbindex WHERE DocId = $docId");
		
		//jumlahkan semua bobot kuadrat 
		$panjangVektor = 0;		
		while($rowVektor = mysql_fetch_array($resVektor)) {
			$panjangVektor = $panjangVektor + $rowVektor['Bobot']  *  $rowVektor['Bobot'];	
		}
		
		//hitung akarnya		
		$panjangVektor = sqrt($panjangVektor);
		
		//masukkan ke dalam tbvektor		
		$resInsertVektor = mysql_query("INSERT INTO tbvektor (DocId, Panjang) VALUES ($docId, $panjangVektor)");	
	} //end while $rowDocId
} //end function panjangvektor
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
//fungsi hitungsim - kemiripan antara query 
//setiap dokumen dalam database (berdasarkan bobot di tbindex)
function hitungsim($query) {
	//ambil jumlah total dokumen yang telah diindex (tbindex atau tbvektor), n
	$resn = mysql_query("SELECT Count(*) as n FROM tbvektor");
	$rown = mysql_fetch_array($resn);	
	$n = $rown['n'];
	
	//terapkan preprocessing terhadap $query
	$aquery = explode(" ", $query);
	
	//hitung panjang vektor query
	$panjangQuery = 0;
	$aBobotQuery = array();
	
	for ($i=0; $i<count($aquery); $i++) {
		//hitung bobot untuk term ke-i pada query, log(n/N);
		//hitung jumlah dokumen yang mengandung term tersebut
		$resNTerm = mysql_query("SELECT Count(*) as N from tbindex WHERE Term = '$aquery[$i]'");
		$rowNTerm = mysql_fetch_array($resNTerm);	
		$NTerm = $rowNTerm['N'] ;
		
		$idf = log($n/$NTerm);
		
		//simpan di array		
		$aBobotQuery[] = $idf;
		
		$panjangQuery = $panjangQuery + $idf * $idf;		
	}
	
	$panjangQuery = sqrt($panjangQuery);
	
	$jumlahmirip = 0;
	
	//ambil setiap term dari DocId, bandingkan dengan Query
	$resDocId = mysql_query("SELECT * FROM tbvektor ORDER BY DocId");
	while ($rowDocId = mysql_fetch_array($resDocId)) {
	
		$dotproduct = 0;
			
		$docId = $rowDocId['DocId'];
		$panjangDocId = $rowDocId['Panjang'];
		
		$resTerm = mysql_query("SELECT * FROM tbindex WHERE DocId = $docId");
		while ($rowTerm = mysql_fetch_array($resTerm)) {
			for ($i=0; $i<count($aquery); $i++) {
				//jika term sama
				if ($rowTerm['Term'] == $aquery[$i]) {
					$dotproduct = $dotproduct + $rowTerm['Bobot'] * $aBobotQuery[$i];				
				} //end if		
			} //end for $i		
		} //end while ($rowTerm)
		
		if ($dotproduct > 0) {
			$sim = $dotproduct / ($panjangQuery * $panjangDocId);	
			
			//simpan kemiripan > 0  ke dalam tbcache
			$resInsertCache = mysql_query("INSERT INTO tbcache (Query, DocId, Value) VALUES ('$query', $docId, $sim)");
			$jumlahmirip++;
		} 
		
	} //end while $rowDocId
	
	if ($jumlahmirip == 0) {
		$resInsertCache = mysql_query("INSERT INTO tbcache (Query, DocId, Value) VALUES ('$query', 0, 0)");
	}	
		
} //end hitungSim()
//--------------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------------
function ambilcache($keyword) {
	$resCache = mysql_query("SELECT *  FROM tbcache WHERE Query = '$keyword' ORDER BY Value DESC");
	$num_rows = mysql_num_rows($resCache);
		
	if ($num_rows >0) {
		//tampilkan semua berita yang telah terurut
		while ($rowCache = mysql_fetch_array($resCache)) {
			$docId = $rowCache['DocId'];
			$sim = $rowCache['Value'];
					
			if ($docId != 0) {					
				//ambil berita dari tabel tbberita, tampilkan
				$resBerita = mysql_query("SELECT * FROM tbberita WHERE Id = $docId");
				$rowBerita = mysql_fetch_array($resBerita);
					
				$judul = $rowBerita['Judul'];
				$berita = $rowBerita['Berita'];
					
				print($docId . ". (" . $sim . ") <font color=blue><b>" . $judul . "</b></font><br />");
				print($berita . "<hr />"); 		
			} else {
				print("<b>Tidak ada... </b><hr />");
			}
		}//end while (rowCache = mysql_fetch_array($resCache))
	}//end if $num_rows>0
	else {
		hitungsim($keyword);
		
		//pasti telah ada dalam tbcache		
		$resCache = mysql_query("SELECT *  FROM tbcache WHERE Query = '$keyword' ORDER BY Value DESC");
		$num_rows = mysql_num_rows($resCache);
		
		while ($rowCache = mysql_fetch_array($resCache)) {
			$docId = $rowCache['DocId'];
			$sim = $rowCache['Value'];
					
			if ($docId != 0) {					
				//ambil berita dari tabel tbberita, tampilkan
				$resBerita = mysql_query("SELECT * FROM tbberita WHERE Id = $docId");
				$rowBerita = mysql_fetch_array($resBerita);
					
				$judul = $rowBerita['Judul'];
				$berita = $rowBerita['Berita'];
					
				print($docId . ". (" . $sim . ") <font color=blue><b>" . $judul . "</b></font><br />");
				print($berita . "<hr />"); 		
			} else {
				print("<b>Tidak ada... </b><hr />");
			}
		} //end while
	}
} //end function ambilcache
//--------------------------------------------------------------------------------------------
//============== akhir koleksi fungsi ==================

?>