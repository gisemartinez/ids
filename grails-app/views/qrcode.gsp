<!DOCTYPE html>
<html>
    <head>
    	<meta name="layout" content="main"/>
    	<title>Patronus</title>
    	<style>
        	.mdi-image-camera-alt,.mdi-av-videocam {font-size: 2em;}
        	div#qrfile {position: relative}
        	div#qrfile p {
        		text-align: center;
        		font-weight: bold;
        		display: block;
        	}
    	</style>
    	<asset:javascript src="llqrcode.js"/>
    	<asset:javascript src="webqr.js"/>
    </head>
    <body>
    	<!-- Header -->
    	<div class="row container-fluid" style="margin-top:40px"></div>
    	
    	<div style="max-width:320px; margin:0 auto">
    		<!-- Escaneo por video o imagen -->
    		<div class="btn-group btn-group-justified">
    			<a onclick="setwebcam()" class="btn btn-default mdi-av-videocam"></a>
    			<a onclick="setimg()" class="btn btn-default mdi-image-camera-alt"></a>
    		</div>
    		<!-- Drag n Drop o Seleccion de archivo -->
    		<div id="outdiv" class="row">
    			<div id="qrfile">
    			</div>
    		</div>
    		<!-- Resultado -->
    		<div id="result" style="text-align: center"></div>
    		<canvas id="qr-canvas" width="800" height="600" style="width: 800px; height: 600px; display: none"></canvas>
    		<script type="text/javascript">load();</script>
    	</div>
    	<!-- Footer -->
    	<div class="row container-fluid" style="margin-top:40px"></div>
    </body>
</html>
