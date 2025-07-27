<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %> <!-- or your actual FactoryProvider package -->
<%@page import="com.entities.*" %>
<%@page import="java.util.List" %>
<%@page import="org.hibernate.query.Query" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <link href="css/style.css" rel="stylesheet"/>
<title>All notes: Note Taker</title>
</head>
<body>
  <div class="container">
    <%@include file="navbar.jsp" %>
    <br>
    
    <h1 class="text-uppercase">All Notes:</h1>
    <div class="row">
    
    <div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query<Note> q = s.createQuery("from Note", Note.class);
				List<Note> list = q.list();

				for (Note note : list) {
					%>

				<div class="card mt-3">
					<img src="img/sticky-notes.png" style="max-width:100px;" class="card-img-top m-4 mx-auto" alt="...">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text"><%=note.getContent() %></p>
						<p><b class="text-primary"><%=note.getAddeddate() %></b></p>
						<div class="container text-center mt-2">
						<a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Edit</a>
						</div>
					</div>
				</div>




				<%
				}

				s.close();
				%>






			</div>
    
    </div>    
  </div>
  
  
  <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    -->

</body>
</html>