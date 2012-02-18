<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,recite18th.library.Db,application.config.Config,recite18th.library.Pagination" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%
	String message="";
	int pagenum;
	pagenum = request.getParameter("pagenum")==null ?0:Integer.parseInt(request.getParameter("pagenum")+"");
%>
<!DOCTYPE HTML>
<html><!-- InstanceBegin template="../../../Templates/home.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Aplikasi Cerdas CAT</title>
<!-- InstanceEndEditable -->
<link rel="shortcut icon" type="image/png" href="<%=Config.base_url%>_desain/favicon.png">
<script src="<%=Config.base_url%>res/js/jquery-1.5.1.js"></script>
<script src="<%=Config.base_url%>res/js/jquery.tools.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=Config.base_url%>_desain/index.css" media="all">

<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<script>
// What is $(document).ready ? See: http://flowplayer.org/tools/documentation/basics.html#document_ready
$(document).ready(function() {

// initialize scrollable together with the autoscroll plugin
var root = $("#scroller").scrollable({circular: true}).autoscroll({ autoplay: true });

// provide scrollable API for the action buttons
window.api = root.data("scrollable");

	
});
</script>


<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-weight: bold;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
</style>
</head>
<body class="">
	
		<div id="header">
			<div class="wrapper">	
				<h2 id="logo">&nbsp;</h2>
				<ul id="menu">
					<li class="">
						<a href="<%=Config.base_url%>index/main">Home</a><span>&gt;</span>
					</li>
					<li class="">
						<a href="<%=Config.base_url%>index/help">Help</a><span>&gt;</span>
					</li>
					<li class="">
						<a href="<%=Config.base_url%>index/about">About</a><span>&gt;</span>
					</li>
				</ul>
			</div>		
		</div>
		
		<div id="top">
										<p align="left" class="category">Computerized Adaptive Testing Cerdas
										<c:if test="${user_credential==null}" >  
										<img src="<%=Config.base_url%>/_desain/header.jpg" width="943" height="303"> </p>
                                        <!--<div class="scrollable" id="scroller"align="center">   
   
   
   <div class="items">
      <div>
         <div>
           <div align="center"><img src="http://farm1.static.flickr.com/143/321464099_a7cfcb95cf_t.jpg" />
             <img src="http://farm4.static.flickr.com/3089/2796719087_c3ee89a730_t.jpg" />
             <img src="http://farm1.static.flickr.com/79/244441862_08ec9b6b49_t.jpg" />
             <img src="http://farm1.static.flickr.com/28/66523124_b468cf4978_t.jpg" />
             <img src="http://farm1.static.flickr.com/164/399223606_b875ddf797_t.jpg" />
           </div>
        </div>
      </div>
   </div>
</div>-->

</div>
</c:if>
	
        <div class="wrapper">
<c:if test="${user_credential!=null}" >
	<div id="docSidebar">
        <h2>${user_credential.username}</h2>
        <p>&nbsp;</p>
        <div id="toc">
	 <ul>
		<c:if test="${user_credential.peran=='Admin'}" >         
            <li>Kelola Pengguna
              <ul>
                <li><a href="<%=Config.base_url%>index/admin/index">Admin</a></li>
                <li><a href="<%=Config.base_url%>index/Pimpinan/index">Pimpinan</a></li>
                <li><a href="<%=Config.base_url%>index/pengajar/index">Pengajar</a></li>
                <li><a href="<%=Config.base_url%>index/PesertaTest/index">Peserta Test</a></li>
                <li><a href="<%=Config.base_url%>index/WaliPesertaTest/index">Wali Peserta Test </a>   </li>   			             		
	          </ul>
            </li>
			<li><a href="<%=Config.base_url%>index/Domain/index">Kelola Domain</a></li>
			<li><a href="<%=Config.base_url%>index/Skl/index">Standar Kompetensi Lulus</a></li>
		 <li>Paket Soal
		 	<ul>
			<li><a href="<%=Config.base_url%>index/PaketSoal/index">Penyajian Tetap</a></li>		
			<li><a href="<%=Config.base_url%>index/PaketSoalTigaButir/index">Paket Tiga Butir Soal</a></li>						
			<li><a href="<%=Config.base_url%>index/PenentuanDomainSoal/index">Penentuan Domain Soal bagi Siswa</a></li>									
		   </ul>
		  </li>
 			 <li><a href="<%=Config.base_url%>index/login/logout">Logout</a></li> 
	    </c:if>
		<c:if test="${user_credential.peran=='Kepala Sekolah'}" >        
		 <li><a href="<%=Config.base_url%>index/pimpinan/pembobotan_skl">Pembobotan SKL</a></li> 
		  <li><a href="<%=Config.base_url%>index/pimpinan/pembobotan_domain">Pembobotan Domain</a></li> 
		   <li><a href="<%=Config.base_url%>index/pimpinan/pembobotan_kriteria">Pembobotan Kriteria Penilaian</a></li> 
           <li><a href="<%=Config.base_url%>index/pimpinan/bukaFormInputKonfigurasi">Konfigurasi Penerimaan</a></li>
           <li><a href="<%=Config.base_url%>index/LihatHasilTest/laporanPenerimaan">Laporan Penerimaan </a></li>
			 <li><a href="<%=Config.base_url%>index/login/logout">Logout</a></li> 
	    </c:if>
		<c:if test="${user_credential.peran=='Pengajar'}" >        
			 <li><a href="<%=Config.base_url%>index/soal/index">Kelola Soal</a></li>
			 <li><a href="<%=Config.base_url%>index/pengajar/bukaViewInputPenilaian/-1">Input Penilaian</a></li> 
			 <li><a href="<%=Config.base_url%>index/LihatHasilTest/laporanPengajarRasch">Laporan Hasil Ujian Model Rasch</a></li>
			 <li><a href="<%=Config.base_url%>index/LihatHasilTest/laporanPenerimaan">Laporan Penerimaan </a></li>		
			 <li><a href="<%=Config.base_url%>index/login/logout">Logout</a></li> 
	    </c:if>		
		<c:if test="${user_credential.peran=='Peserta Test'}" >        
        <c:if test="${user_credential.verified==0}" >
			 <li><a href="<%=Config.base_url%>index/SignUp/index">Verifikasi</a></li>
         </c:if>
         <c:if test="${user_credential.verified==1}"> 	
			 <li><a href="<%=Config.base_url%>index/AmbilUjian/index">Ambil Ujian</a></li> 				 	
			 <li><a href="<%=Config.base_url%>index/LihatHasilTest">Lihat Hasil Ujianku</a></li> 				 		</c:if>
			 <li><a href="<%=Config.base_url%>index/LihatHasilTest/laporanPenerimaan">Laporan Penerimaan </a></li>
			 <li><a href="<%=Config.base_url%>index/login/logout">Logout</a></li> 
	    </c:if>		 
		<c:if test="${user_credential.peran=='Wali Peserta Test'}" >        
		<li><a href="<%=Config.base_url%>index/LihatHasilTest/laporanPenerimaan">Laporan Penerimaan </a></li>
			 <li><a href="<%=Config.base_url%>index/login/logout">Logout</a></li> 
	    </c:if>
		
      </div>
    
	    <h2>&nbsp;</h2>
      <h2>&nbsp;</h2>
      <div id="searchBox"></div>
        
    </div><!-- docsidebar -->
</c:if>	
	<div id="pageContent">
		
	  <div class="wikistyle">
	    <h1 id="Startinguptheproject"><!-- InstanceBeginEditable name="judul_modul" -->Form Soal Pengajar <!-- InstanceEndEditable --></h1>
	    <!-- InstanceBeginEditable name="isi_modul" -->
	    <h1></h1>
		
	    <table border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#E8EDFF">
          <tr>
            <td><form action="<%=Config.base_url%>index/soal/save" method="post"  enctype="multipart/form-data" name="form2">
                <table id="hor-zebra" summary="Employee Pay Sheet">
                  <thead>
                    <tr>
                      <th colspan="2" class="odd" scope="col">Form Soal </th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr >
                      <td valign="top">Domain</td>
                      <td valign="top"><label>
                        <select name="iddomain" id="iddomain">
                          <option value="-1">-- Pilih Domain --</option>
						<c:forEach items="${row_iddomain}" var="item" varStatus="status">
                          <option value="${item.iddomain}" <c:if test="${model.iddomain==item.iddomain}"> selected="selected" </c:if> >${item.domain}</option>
						 </c:forEach>						  
                        </select>
                      </label></td>
                    </tr>
                    <tr >
                      <td valign="top">SKL</td>
                      <td valign="top"><select name="idskl" id="idskl">
                        <option value="-1">-- Pilih SKL --</option>
                        <c:forEach items="${row_idskl}" var="item" varStatus="status"> 
							<option value="${item.idskl}" 
                            <c:if test="${model.idskl==item.idskl}"> selected="selected" </c:if>
                            >${item.nama_skl}
                          </option>
                        </c:forEach>
                                                                  </select></td>
                    </tr>
                    <tr >
                      <td valign="top">Teks Soal</td>
                      <td valign="top"><label>
                      <textarea name="soal" cols="50" rows="10" id="soal">${model.soal}</textarea>
                      <input name="idsoal" type="hidden" id="idsoal" value="${model.idsoal}">
                      </label></td>
                    </tr>
                    <tr >
                      <td valign="top">Gambar</td>
                      <td valign="top"><label>
                      <input name="gambar" type="file" id="gambar">
                      </label></td>
                    </tr>
                    <tr >
                      <td valign="top">Jawaban</td>
                      <td valign="top"><label>
                        <select name="jawaban" id="jawaban">
                          <option value="-1">-- Pilih Jawaban --</option>
                          <option value="A" <c:if test="${model.jawaban=='A'}"> selected="selected" </c:if>>A</option>
                          <option value="B" <c:if test="${model.jawaban=='B'}"> selected="selected" </c:if>>B</option>
                          <option value="C" <c:if test="${model.jawaban=='C'}"> selected="selected" </c:if>>C</option>
                          <option value="D" <c:if test="${model.jawaban=='D'}"> selected="selected" </c:if>>D</option>
						  <option value="E" <c:if test="${model.jawaban=='E'}"> selected="selected" </c:if>>E</option>						  
                      </select>
                      </label></td>
                    </tr>
                    <tr >
                      <td valign="top">RASCH</td>
                      <td valign="top">&nbsp;</td>
                    </tr>
                    <tr >
                      <td valign="top"><blockquote>
                        <p>b</p>
                      </blockquote></td>
                      <td valign="top"><label>
                      <input name="rasch_b" type="text" id="rasch_b" value="${model.rasch_b}">
                      </label></td>
                    </tr>
                    <tr >
                      <td valign="top">1 PL </td>
                      <td valign="top">&nbsp;</td>
                    </tr>
                    <tr >
                      <td valign="top"><blockquote>
                        <p>b</p>
                      </blockquote></td>
                      <td valign="top"><label>
                        <input name="lg1_b" type="text" id="lg1_b" value="${model.lg1_b}">
                      </label></td>
                    </tr>
                    <tr >
                      <td valign="top">2 PL </td>
                      <td valign="top">&nbsp;</td>
                    </tr>
                    <tr class="odd">
                      <td><blockquote>a</blockquote></td>
                      <td><input name="lg2_a" type="text" id="lg2_a" value="${model.lg2_a}"></td>
                    </tr>
                    <tr class="odd">
                      <td><blockquote>b</blockquote></td>
                      <td><input name="lg2_b" type="text" id="lg2_b" value="${model.lg2_b}"></td>
                    </tr>
                    <tr class="odd">
                      <td>3 PL </td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                      <td><blockquote>a</blockquote></td>
                      <td><input name="lg3_a" type="text" id="lg3_a" value="${model.lg3_a}"></td>
                    </tr>
                    <tr class="odd">
                      <td><blockquote>b</blockquote></td>
                      <td><input name="lg3_b" type="text" id="lg3_b" value="${model.lg3_b}"></td>
                    </tr>
                    <tr class="odd">
                      <td><blockquote>c</blockquote></td>
                      <td><input name="lg3_c" type="text" id="lg3_c" value="${model.lg3_c}"></td>
                    </tr>
                    <tr class="odd">
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                      <td>&nbsp;</td>
                      <td><input name="Submit" type="submit" id="Submit" value="Simpan">
                          <input name="Button" type="button" id="Submit" value="Batal" onClick="javascript:history.back(-1);"></td>
                    </tr>
                  </tbody>
                </table>
            </form></td>
          </tr>
        </table>
	    <!-- InstanceEndEditable --></div>
		
		<div id="comments"></div>
</div>
        </div>
		<div id="footer">
			<div class="wrapper">
				<p align="center">Hak Cipta (C) Rukli 2011 <a href="http://www.playapps.net/"></a>				</p>
		  </div>
		</div>
   </body>
<!-- InstanceEnd --></html>
