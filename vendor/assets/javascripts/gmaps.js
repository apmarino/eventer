console.log("LINKED BITCHES")
var map;
      var marker

      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat:parseFloat($.cookie("lat")), lng:parseFloat($.cookie("long"))},
          zoom: 12,
        });

        <% counter=0%>
     <% @events.each do | event | %>
      marker = new google.maps.Marker({
         position: {lat:<%=event['venue']['latitude']%>, lng:<%=event['venue']['longitude']%>},
         map: map,
         title: '<%=event['venue']['name']%>'

       });

          google.maps.event.addListener(marker, 'click', function() {
      window.location.href = "/events/show/<%=event['venue']['city']%>/<%=event['venue']['region']%>/<%=event['id']%>";
      });
         eventDiv = $('.hover<%counter%>')        
         eventDiv[0].addEventListener('mouseover', function(){toggleBounce})
          function toggleBounce() {
              marker.setAnimation(google.maps.Animation.BOUNCE);
            setTimeout(function(){marker.setAnimation(null)}, 1500)
          }
      <%counter += 1%>
      <%end%>

      }