<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Patronus</title>
		<style>
			.mdi-image-camera-alt,.mdi-av-videocam {
				font-size: 2em;
			}
			div#qrfile {position: relative }
			div#qrfile p {
				text-align: center;
				font-weight: 400;
				display: block;
			}
			.tabs .indicator {
				background-color: #009688 !important
			}
			.tabs .tab a, .tabs .tab a:hover {
				color: #009688 !important
			}
		</style>
		<asset:javascript src="llqrcode.js"/>
		<asset:javascript src="webqr.js"/>
	</head>
	<body>
		<div style="max-width:320px; margin:0 auto">
			<!-- Escaneo por video o imagen -->
			<ul class="tabs">
				<li class="tab col s3"><a href="#test1" onclick="setwebcam()">Video</a></li>
				<li class="tab col s3"><a href="#test2" onclick="setimg()">Imagen</a></li>
			</ul>
			<!-- Drag n Drop o Seleccion de archivo -->
			<div id="outdiv" class="row">
				<div id="qrfile"></div>
			</div>
			<!-- Resultado -->
			<div id="test1" class="col s12">
				<div id="outdiv" class="row">
					<div id="qrfile"></div>
				</div>
			</div>
			<div id="test2" class="col s12">
				<div id="outdiv" class="row">
					<div id="qrfile"></div>
				</div>
			</div>
			
			<div id="result" style="text-align: center"></div>
			<canvas id="qr-canvas" width="800" height="600" style="width: 800px; height: 600px; display: none"></canvas>
			<script type="text/javascript">load();</script>
		</div>
	</body>
</html>
