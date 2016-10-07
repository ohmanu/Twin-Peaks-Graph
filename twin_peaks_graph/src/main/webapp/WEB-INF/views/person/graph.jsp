<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<style>
	h1 {color: ${colour};}
</style>
	
<t:layout>
	<h1>${type} LINK</h1>
	
	<div id="cy"></div>	
	<!-- cytoscape -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="http://cytoscape.github.io/cytoscape.js/api/cytoscape.js-latest/cytoscape.min.js"></script>
	
	<!-- cytoscape spread layout-->
	<script src="https://cdn.rawgit.com/cytoscape/cytoscape.js-spread/1.0.9/cytoscape-spread.js"></script>

	<!-- cytoscape qtip-->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.js"></script>
	<link href="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.css" rel="stylesheet" type="text/css" />	
	<script src="https://cdn.rawgit.com/cytoscape/cytoscape.js-qtip/2.2.5/cytoscape-qtip.js"></script>
	
	<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" />
	
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
							'border-color': '${colour}',
							'border-width': 3,
							'border-opacity': 0.5,
							'label': 'data(name)',
							'font-size': 16,
							'color': '${colour}'
						})
					.selector('edge')
						.css({
							'width': 6,
							'line-color': '${colour}',
							'opacity': 0.4,
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
								{ data: { id: '${relationship.person1.id}' , name: '${relationship.person1.name}' } },
								{ data: { id: '${relationship.person2.id}' , name: '${relationship.person2.name}'} },
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
						name: 'spread',
						minDist: 100
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

			}); // on tap
			
			// Show BIO 1
			<c:forEach items="${people}" var="relationship">
				cy.$('#${relationship.person1.id}').qtip({
				  content: '${relationship.person1.bio}',
				  position: {
				    my: 'top center',
				    at: 'bottom center'
				  },
				  style: {
				    classes: 'qtip-bootstrap',
				    tip: {
				      width: 16,
				      height: 8
				    }
				  }
				});
			</c:forEach>
			// End Show BIO 1
			// Show BIO 2
			<c:forEach items="${people}" var="relationship">
				cy.$('#${relationship.person2.id}').qtip({
				  content: '${relationship.person2.bio}',
				  position: {
				    my: 'top center',
				    at: 'bottom center'
				  },
				  style: {
				    classes: 'qtip-bootstrap',
				    tip: {
				      width: 16,
				      height: 8
				    }
				  }
				});
			</c:forEach>
			// End Show BIO 2
		});		
	</script>
</t:layout>