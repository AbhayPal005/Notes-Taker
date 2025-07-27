<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %> <!-- or your actual FactoryProvider package -->
<%@page import="com.entities.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <link href="css/style.css" rel="stylesheet"/>
    <title>Edit your Note</title>
    <br>
  </head>
  <body>
     <div class="container">
     
       <%@include file="navbar.jsp" %>
       <h1>This is Edit Page</h1>
       <%
       int noteId=Integer.parseInt(request.getParameter("note_id").trim());
       Session s=FactoryProvider.getFactory().openSession();
       
       Note note=(Note)s.get(Note.class,noteId);
       
       %>

		<form action="UpdateServlet" method="post">
		    
		    <input value="<%=note.getId()%>" name="noteId" type="hidden"/>
			<div class="form-group">
				<label for="Title">Note Title</label> 
				<input name="title" required
					type="text" 
					class="form-control" 
					id="title"
					aria-describedby="emailHelp" 
					placeholder="Enter here"
					value="<%=note.getTitle() %>"
					/>
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required name="content" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 500px;">
					<%=note.getContent() %>
					</textarea>
			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-primary">Save your note</button>


			</div>
		</form>


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