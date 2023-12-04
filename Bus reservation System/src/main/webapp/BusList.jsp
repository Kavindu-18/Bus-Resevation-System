  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
function confirmDelete(regNo) {
    var confirmDelete = confirm("Are you sure you want to delete this bus?");
    if (confirmDelete) {
        window.location.href = "deleteBusServlet?regNo=" + regNo;
    }
}
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
            <div class="insight">
                <div class="sales">
                    <span class="material-icons-sharp">analytics</span>
                    <div class="middle">
                        <div class="left">
                            <h2>No Of Orders</h2>
                            <h1>$25,024</h1>
                        </div>

                    </div>
                </div>
                <!---------------------- END OF SALES---------------->
                <div class="Expenses">
                    <div class="middle">
                        <div class="left">
                            <div id="clock">
                                <h1 id="date-time"></h1>
                            </div>
                        </div>
                    </div>
                </div>
                <!---------------------- END OF EXPENSES---------------->
                <div class="Income">
                    <span class="material-icons-sharp">stacked_line_chart</span>
                    <div class="middle">
                        <div class="left">
                            <h2>To be paid</h2>
                            <h1>$20,024</h1>
                        </div>
                    </div>
                    <small class="text-muted">Last 24 Hours</small>
                </div>
                <!---------------------- END OF INCOME---------------->
            </div>
            <br>
            <br>
           <div class="recent-orders">
                <h2>Recently added</h2>
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
					        <th>Bus Registration No</th>
					        <th>Type</th>
					        <th>Name</th>
					        <th>Capacity</th>
					        <th>Route</th>
					        <th>Permit No</th>
					        <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                            <c:set var="rowNumber" value="1" />
    <c:forEach items="${busList}" var="bus">
        <!-- Set parameters for each bus -->
        <c:set var="regNo" value="${bus.busRegistrationNo}" />
        <c:set var="type" value="${bus.type}" />
        <c:set var="name" value="${bus.name}" />
        <c:set var="capacity" value="${bus.capacity}" />
        <c:set var="route" value="${bus.route}" />
        <c:set var="permitNo" value="${bus.permitNo}" />

        <tr>
            <td>${rowNumber}</td>
            <td>${bus.busRegistrationNo}</td>
            <td>${bus.type}</td>
            <td>${bus.name}</td>
            <td>${bus.capacity}</td>
            <td>${bus.route}</td>
            <td>${bus.permitNo}</td>
            <td>
                <div style="display: flex; justify-content: center; align-items: center;">
                    <form action="UpdateBus.jsp" method="post">
                        <!-- Hidden input fields to pass parameters -->
                        <input type="hidden" name="regNo" value="${regNo}" />
                        <input type="hidden" name="type" value="${type}" />
                        <input type="hidden" name="name" value="${name}" />
                        <input type="hidden" name="capacity" value="${capacity}" />
                        <input type="hidden" name="route" value="${route}" />
                        <input type="hidden" name="permitNo" value="${permitNo}" />
                       <button type="submit" style="background-color: green; color: white; margin-left: 10px; padding: 10px; border: none; border-radius: 5px; cursor: pointer;">Update</button>
                    </form>
                   <button style="background-color: red; color: white; margin: 10px; padding: 10px; border: none; border-radius: 5px; cursor: pointer;" onclick="confirmDelete('${bus.busRegistrationNo}')">Delete</button>
                </div>
            </td>
        </tr>
        <c:set var="rowNumber" value="${rowNumber + 1}" />
    </c:forEach>
                    </tbody>
                </table>
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

            <!-- !if somthing needed for right side add here -->
            <div class = "recent updates">
            <h2>Recent updates</h2>
            <div class="updates">
            <c:forEach items="${latestBus}" var="bus">
                <div class="update" style="margin-top: 20px; margin-left: 20px; background-color: #f2f2f2; padding: 10px; border-radius: 10px;">
        		
                    <div class="message">
                        <p><b>Bus Registration No :</b>${bus.busRegistrationNo} </p>
                        <p><b>Type :</b>${bus.type} </p>
                        <p><b>Name :</b>${bus.name} </p>
                        <p><b>Seat Capacity :</b>${bus.capacity} </p>
                        <p><b>Route :</b>${bus.route} </p>
                        <p><b>Permit No :</b>${bus.permitNo} </p>

                    </div>
                </div>
                </c:forEach>
                
            
            </div>
        </div>

    </div>

<script src="script.js"></script>

<script>

window.addEventListener("load", () => {
  clock();
  function clock() {
    const today = new Date();

    // get time components
    const hours = today.getHours();
    const minutes = today.getMinutes();
    const seconds = today.getSeconds();

    //add '0' to hour, minute & second when they are less 10
    const hour = hours < 10 ? "0" + hours : hours;
    const minute = minutes < 10 ? "0" + minutes : minutes;
    const second = seconds < 10 ? "0" + seconds : seconds;

    //make clock a 12-hour time clock
    const hourTime = hour > 12 ? hour - 12 : hour;

    const ampm = hour < 12 ? "AM" : "PM";

    // get date components
    const month = today.getMonth();
    const year = today.getFullYear();
    const day = today.getDate();

    //declaring a list of all months in  a year
    const monthList = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    //get current date and time
    const date = monthList[month] + " " + day + ", " + year;
    const time = hourTime + ":" + minute + ":" + second + ampm;

    //combine current date and time
    const dateTime = date + " - " + time;

    //print current date and time to the DOM
    document.getElementById("date-time").innerHTML = dateTime;
    setTimeout(clock, 1000);
  }
});
</script>



</body>
</html>
