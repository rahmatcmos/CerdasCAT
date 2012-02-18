<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,recite18th.library.Db,application.config.Config,recite18th.library.Pagination,java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Aplikasi Cerdas CAT</title>
<link rel="shortcut icon" type="image/png" href="<%=Config.base_url%>_desain/favicon.png">
<%
	String message="";
	int pagenum;
	pagenum = request.getParameter("pagenum")==null ?0:Integer.parseInt(request.getParameter("pagenum")+"");
	NumberFormat format = DecimalFormat.getInstance();
%>


<style type="text/css">
<!--
.style2 {
	font-size: large;
	font-weight: bold;
}
-->
</style>
<script language="Javascript1.2">
  <!--
  function printpage() {
  	window.print();
  }
  //-->
</script>
</head>
<body class="" onLoad="printpage()">

	<div id="pageContent">
		
	  <div class="wikistyle">
	    <h1 align="center" id="Startinguptheproject">Aplikasi Cerdas CAT </h1>
	    
		<% //this is all the code that need to be done
			String peserta[][]=Db.getDataSet("SELECT id, nomor_peserta, nama_lengkap,asal,inisialisasi_kemampuan,model_logistik,metode,penyajian_soal FROM peserta_test p where inisialisasi_kemampuan='Tiga Butir' and model_logistik='Rasch' and metode='Futsuhilow' and penyajian_soal='Proporsional' order by nomor_peserta");
		%>
		<% if(peserta.length==0) { %>
		Tidak ada data laporan yang bisa ditampilkan
		<% 
		} else {
			double skor_minimum=0;
			int kuota_maksimum=0;
			String data[][] = Db.getDataSet("select skor_minimum,kuota from konfigurasi");
			skor_minimum = Double.parseDouble(data[0][0]);
			kuota_maksimum = Integer.parseInt(data[0][1]);
		%>
	    <p align="center" id="aIntroductiona">&nbsp;</p>
	    <div align="center">
  <table width="42%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#666666">
    <tr>
      <td colspan="3"><div align="center">
        <p class="style2">LAPORAN PENERIMAAN </p>
        <p>&nbsp;</p>
      </div></td>
        </tr>
    <tr>
      <td width="42%">Inisialisasi</td>
          <td width="4%" valign="top">:</td>
          <td width="54%"><%=peserta[0][4]%></td>
        </tr>
    <tr>
      <td>Model</td>
          <td valign="top">:</td>
          <td><%=peserta[0][5]%></td>
        </tr>
    <tr>
      <td>Metode</td>
          <td valign="top">:</td>
          <td><%=peserta[0][6]%></td>
        </tr>
    <tr>
      <td>Penyajian Soal </td>
          <td valign="top">:</td>
          <td><%=peserta[0][7]%></td>
        </tr>
    <tr>
      <td>&nbsp;</td>
          <td valign="top">:</td>
          <td>&nbsp;</td>
        </tr>
    <tr>
      <td>Skor Minimum</td>
          <td valign="top">:</td>
          <td><%=skor_minimum%></td>
        </tr>
    <tr>
      <td>Kuota Maksimum</td>
          <td valign="top">:</td>
          <td><%=kuota_maksimum%></td>
        </tr>
    <tr>
      <td>&nbsp;</td>
          <td valign="top">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
    <tr>
      <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
  </table>
  <br/>
	      
	      <%
  
  	//tabel bobot penilaian
	String bobotKriteria[][] = Db.getDataSet("SELECT idpenilaian,bobot FROM penilaian");
  	int i = 0;
	int jumlah_peserta=0;
	for(i=0;i<peserta.length;i++) {
	//hitung Nilai Pembobotan
	//ambil domain yang dipakai pada soal peserta ini
	String sql = "SELECT d.iddomain,d.domain FROM peserta_test_jawaban_dengan_model p,soal s,domain d where p.idpeserta_test="+peserta[i][0]+" and p.idsoal=s.idsoal and s.iddomain = d.iddomain group by d.iddomain";
	String domain[][] = Db.getDataSet(sql);
	if(domain.length<3) continue;/* quick fix */
	jumlah_peserta++;
	double totalNilaiDomain = 0;
	for(int idomain = 0; idomain < domain.length; idomain++)
	{
		//ambil bobot domain 
		String bobotDomain[][]=Db.getDataSet("select bobot from pembobotan_domain where iddomain=" + domain[idomain][0]);
		int iBobotDomain = Integer.parseInt(bobotDomain[0][0]);
		//ambil skl tiap domain
		String skl[][] = Db.getDataSet("select nama_skl from skl where iddomain = " + domain[idomain][0]);
		double bobot_skl=0;
		
		/* quick fix */
		int jum_domain=0;
		double nilaiDomain=0;
		for(int iskl=0;iskl<skl.length;iskl++)
		{
			String query_bobot_skl = "SELECT skl.nama_skl, sum(p.skor) as total_skor,ps.bobot  FROM peserta_test_jawaban_dengan_model p,soal s, domain d, skl,pembobotan_skl ps  where skl.idskl=ps.idskl and skl.nama_skl='"+ skl[iskl][0] +"' and p.nilai=1 and s.idskl=skl.idskl and p.idsoal = s.idsoal and s.iddomain = d.iddomain and d.iddomain="+ domain[idomain][0]+" and idpeserta_test="+peserta[i][0]+" group by skl.nama_skl  order by idpeserta_test_jawaban_dengan_model";
			//out.print(query_bobot_skl+"<br/>");
			String bskl[][] = Db.getDataSet(query_bobot_skl);
            if(bskl.length>0) {
				bobot_skl+= Double.parseDouble(bskl[0][1])*Double.parseDouble(bskl[0][2])/100;		
				jum_domain++;
			}
		}
		
		nilaiDomain = iBobotDomain * bobot_skl/100;
		//out.print(i + ": " + peserta[i][2] + " : Nilai bobot SKL untuk domain " + domain[idomain][1] + " : " +  bobot_skl+", Nilai Domainnya = " +nilaiDomain+ "<hr/>");
       
        totalNilaiDomain+=nilaiDomain;
		
		}
		
		//masukkan nilai domain
		
		//nilai kriteria
		double nilaiKriteria=0, totalNilaiKriteria=0;
		for(int ikriteria=0;ikriteria<bobotKriteria.length;ikriteria++)
		{
			String sqlPenilaian = "select idpenilaian_peserta,nilai from penilaian_peserta where idpeserta_test="+peserta[i][0]+" and idpenilaian="+bobotKriteria[ikriteria][0];
			//out.print(sqlPenilaian);
			String dataNilai[][]=Db.getDataSet(sqlPenilaian);
			if(dataNilai.length>0) 
			{
				nilaiKriteria=Double.parseDouble(bobotKriteria[ikriteria][1])*Double.parseDouble(dataNilai[0][1])/100;
				totalNilaiKriteria+=nilaiKriteria;
				
				//update nilai total domain
				if(bobotKriteria[ikriteria][0].equals("1"))
				{
					Db.executeQuery("update penilaian_peserta set nilai="+totalNilaiDomain+" where idpenilaian=1 and idpeserta_test="+peserta[i][0]);
				}
				
			}else
			{
				if(bobotKriteria[ikriteria][0].equals("1"))
				{
					Db.executeQuery("insert into penilaian_peserta(idpenilaian,idpeserta_test,nilai) values(1,"+peserta[i][0]+","+totalNilaiDomain+")");
				}
				
				nilaiKriteria=Double.parseDouble(bobotKriteria[ikriteria][1])*totalNilaiDomain/100;
				totalNilaiKriteria+=nilaiKriteria;
			}
		}
		
		Db.executeQuery("update peserta_test set skor_akhir = " + totalNilaiKriteria + ",skor_domain="+totalNilaiDomain+" where id="+peserta[i][0]);
	}
	}
  %>
	      
        </div>
	    <table width="62%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#333333" id="rounded-corner">
		<thead>
		
  <tr>
    <td height="40" class="rounded-company" scope="col">No.</td>
    <td scope="col" class="rounded-q1"><div align="center">Nomor Peserta </div></td>
    <td scope="col" class="rounded-q1"><div align="center">Nama Lengkap </div></td>
    <td scope="col" class="rounded-q1"><div align="center">Asal SD </div></td>
    <td scope="col" class="rounded-q1"><div align="center">Nilai Domain </div></td>
    <td scope="col" class="rounded-q1"><div align="center">Skor Penerimaan  </div></td>
    </tr>
		</thead>
<%
	String konfigurasi[][] = Db.getDataSet("select kuota, skor_minimum from konfigurasi");
	peserta =Db.getDataSet("SELECT id, nomor_peserta, nama_lengkap,asal,skor_akhir,skor_domain FROM peserta_test p where inisialisasi_kemampuan='Tiga Butir' and model_logistik='Rasch' and metode='Futsuhilow' and penyajian_soal='Proporsional' and skor_akhir>"+konfigurasi[0][1]+" order by skor_akhir desc limit 0,"+konfigurasi[0][0]);
	
	for(int i=0;i<peserta.length;i++)
	{
%>
  <tr>
    <td><div align="right"><%=i+1%></div></td>
    <td><%=peserta[i][1]%></td>
    <td><%=peserta[i][2]%></td>
    <td><%=peserta[i][3]%></td>
    <td><div align="right"><%=format.format(Double.parseDouble(peserta[i][4]))%></div></td>
    <td><div align="right"><%=format.format(Double.parseDouble(peserta[i][5]))%></div></td>
    </tr>
<% } %>
</table>
</div>
		
		<div id="comments"></div>
</div>
        </div>
		<div id="footer">
			<div class="wrapper">
				<p align="center">Hak Cipta (C) Rukli 2011 <a href="http://www.playapps.net/"></a>				</p>
		  </div>
		</div>
</body></html>
