<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">

    <!---------CSS ----------->
    <link rel="stylesheet" href="./assets/dashboard.css">


    <style>
        #clock {
  text-align: center;
  font-family: "Oswald", sans-serif;
  font-weight: 300;
  font-size: 1.5rem;
  padding-top: 5vh;
  display: flex;
  justify-content:center;
  align-items:start;
  background-color: #ffffff;
  height: 2vh;;
}


</style>
<script>
<% if (request.getAttribute("successMessage") != null) { %>
<script>
    alert("<%= request.getAttribute("successMessage") %>");
</script>
<% } else if (request.getAttribute("errorMessage") != null) { %>
<script>
    alert("<%= request.getAttribute("errorMessage") %>");
</script>
<% } %>
</script>
</head>
<body>
<div class="container">

        <aside>
            <div class="top">
                <div class="logo">
                    <img src="./assets/logo.jpg">
                    <h2 id="k">SEAT<span class="danger"></span>GURU</h2>
                </div>
            </div>
            <div class="sidebar" >
                <a href="http://localhost:8090/Juniors_oop/retirveBusServlet">
                    <span class="material-icons-sharp">grid_view</span>
                    <h3>Dashboard</h3>
                </a>
                <a href="http://localhost:8090/Juniors_oop/BusInsert.jsp" >
                    <span class="material-icons-sharp">person_outline </span>
                    <h3>Add bus</h3>
                </a>
                <a href="#">
                    <span class="material-icons-sharp">logout </span>
                    <h3>logout</h3>
                </a>

            </div>
        </aside>
        <!---------------- END OF ASIDE---------------->
        <main>
            <h1>dashboard</h1>

           <div class="recent-orders">
            <div class="bus-add" style=" margin-left: 300px;">
                <h2>Bus Add Form</h2>
<div style="width: 70%; margin: auto;">
    <form action="Add-New-Bus" method="POST" style="display: flex; flex-direction: column; align-items: center; padding: 20px; border: 1px solid #e0e0e0; border-radius: 10px; background-color: #f9f9f9;">
        <div style="width: 100%;">
            <label for="type" style="font-weight: bold; margin-bottom: 10px;">Bus Type:</label>
            <select id="type" name="type" required style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 20px;">
                <option value="City Bus">City Bus</option>
                <option value="School Bus">School Bus</option>
                <option value="Coach Bus">Coach Bus</option>
                <option value="Shuttle Bus">Shuttle Bus</option>
                <option value="Tour Bus">Tour Bus</option>
            </select>
        </div>
        <div style="width: 100%;">
            <label for="name" style="font-weight: bold; margin-bottom: 10px;">Bus Name:</label>
            <input type="text" id="name" name="name" required style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 20px;">
        </div>
        <div style="width: 100%;">
            <label for="regNo" style="font-weight: bold; margin-bottom: 10px;">Bus Registration No:</label>
            <input type="text" id="regNo" name="regNo" required style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 20px;">
        </div>
        <div style="width: 100%;">
            <label for="capacity" style="font-weight: bold; margin-bottom: 10px;">Seat Capacity:</label>
            <input type="number" id="capacity" name="capacity" required style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 20px;">
        </div>
        <div style="width: 100%;">
            <label for="route" style="font-weight: bold; margin-bottom: 10px;">Bus Route:</label>
            <input type="text" id="route" name="route" required style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 20px;">
        </div>
        <div style="width: 100%;">
            <label for="permitno" style="font-weight: bold; margin-bottom: 10px;">Permit Number:</label>
            <input type="text" id="permitno" name="permitNo" required style="width: 100%; padding: 10px; border-radius: 5px; border: 1px solid #ddd; margin-bottom: 20px;">
        </div>
        <div style="width: 100%; text-align: center;">
            <input type="submit" value="Submit" style="width: 50%; padding: 10px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer;">
        </div>
    </form>
</div>


            </div>
            </div>
            
        </main>
        <!-------------------------------------- END OF MAIN---------------------------------------->

        <div class="right">
            <div class="top">
                <button id="menu-btn">
                    <span class="material-icons-sharp">menu</span>
                </button>
                <div class="theme-toggler">
                    <span class="material-icons-sharp active">light_mode</span>
                    <span class="material-icons-sharp">dark_mode</span>
                </div>
                <div class="profile">
                    <div class="info">
                        <p>Hey, <b>Daniel</b></p>
                        <small class="text-muted">Admin</small>
                    </div>
                    <div class="profile-photo">
                        <img src="./images/profile-1.jpg">
                    </div>
                </div>
            </div>
            <!---------END OF RIGHT TOP---------->

    </div>





</body>
</html>