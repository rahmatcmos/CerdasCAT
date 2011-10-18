<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*,recite18th.library.Db,application.config.Config,recite18th.library.Pagination" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% int pagenum = 0; %>
<a href="<%=Config.base_url%>index/WaliPesertaTest/input/-1">Tambah Data</a>
<table width="100%" id="rounded-corner">
<thead>
  <tr>
  <th scope="col" class="rounded-company">No.</th>
  <th scope="col" class="rounded-q1">Id</th>
  <th scope="col" class="rounded-q1">Username</th>
  <th scope="col" class="rounded-q1">Password</th>
  <th scope="col" class="rounded-q1">Peran</th>
  <th scope="col" class="rounded-q1">Idpeserta Test</th>
  <th scope="col" class="rounded-q4">Aksi</th>
  </tr>
</thead>
<tfoot>
  <tr>
    <td colspan="6" class="rounded-foot-left"><%=Pagination.createLinks(pagenum)%></td>
    <td class="rounded-foot-right">&nbsp;</td>
  </tr>
</tfoot>
<tbody>
  <c:forEach items="${row}" var="item" varStatus="status" >
    <tr>
      <td>${status.count}</td>
      <td>${item.id}</td>
      <td>${item.username}</td>
      <td>${item.password}</td>
      <td>${item.peran}</td>
      <td>${item.idpeserta_test}</td>
      <td>
         <a href="<%=Config.base_url%>index/WaliPesertaTest/input/${item.id}">Ubah</a>
         <a href="<%=Config.base_url%>index/WaliPesertaTest/delete/${item.id}" onClick="return confirm('Apakah Anda yakin?');">Hapus</a>
      </td>
    </tr>
  </c:forEach>
</tbody>
</table>
