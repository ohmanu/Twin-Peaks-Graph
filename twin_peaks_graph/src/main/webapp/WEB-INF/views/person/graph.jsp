<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:layout>
	<h1>RELATIONSHIP</h1>
	<div id="cy"></div>	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="http://cytoscape.github.io/cytoscape.js/api/cytoscape.js-latest/cytoscape.min.js"></script>
	
	<script>
	$(function(){   
		var cy = cytoscape({
		  container: document.getElementById('cy'),
		  
		  boxSelectionEnabled: false,
		  autounselectify: true,
		  
		  style: cytoscape.stylesheet()
		    .selector('node')
		      .css({
		        'height': 80,
		        'width': 80,
		        'background-fit': 'cover',
		        'border-color': '#000',
		        'border-width': 3,
		        'border-opacity': 0.5
		      })
		    .selector('.eating')
		      .css({
		        'border-color': 'red'
		      })
		    .selector('.eater')
		      .css({
		        'border-width': 9
		      })
		    .selector('edge')
		      .css({
		        'width': 6,
		        'line-color': '#ffaaaa',
		        'curve-style': 'bezier'
		      })
		      
				// Load photos
				<c:forEach items="${people}" var="relationship">
					.selector('#${relationship.person1.id}')
		      		.css({
						'background-image': '${relationship.person1.photo}'
		      		})
		      		.selector('#${relationship.person2.id}')
		      		.css({
						'background-image': '${relationship.person2.photo}'
		      		})
				</c:forEach>,
				// End load photos
		  
		  elements: {
		    nodes: [
		            
				// Load names
				<c:forEach items="${people}" var="relationship">
					{ data: { id: '${relationship.person1.id}' } },
					{ data: { id: '${relationship.person2.id}' } },
				</c:forEach>
				//End load names
		    ],
		    edges: [
		            
				// Load relationships
				<c:forEach items="${people}" var="relationship">
					{ data: { source: '${relationship.person1.id}', target: '${relationship.person2.id}' } },
				</c:forEach>
				// End load relationships
		    ]
		  },
		  
		  layout: {
		    name: 'breadthfirst',
		    directed: false,
		    padding: 10
		  }
		}); // cy init
		  
		cy.on('tap', 'node', function(){
		  var nodes = this;
		  var tapped = nodes;
		  
		  for(;;){
		    var connectedEdges = nodes.connectedEdges(function(){
		      return !this.target().anySame( nodes );
		    });
		    
		    var connectedNodes = connectedEdges.targets();
		    
		    nodes = connectedNodes;
		    
		    if( nodes.empty() ){ break; }
		  }
		        
		  var delay = 0;
		  var duration = 500;
	
		  
		}); // on tap
	
		});		
	</script>
</t:layout>