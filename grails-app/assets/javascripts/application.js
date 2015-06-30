/*
* This is a manifest file that'll be compiled into application.css, which will include all the files
* listed below.
*
* Any CSS file within this directory can be referenced here using a relative path.
*
* You're free to add application-wide styles to this file and they'll appear at the top of the
* compiled file, but it's generally better to create a new file per style scope.
*
*= require_self
*/

*{font-family: 'Roboto','Droid Sans',arial,sans-serif}

/*//NAVBARS//*/
.navbar.navbar,.navbar-default.navbar {color:white}
.navmenu-nav>li.account-circle,.navmenu-nav>li.account-circle>a.account-circle,.perfil {background-color:#009688;color:white}
.navmenu-default .navmenu-nav>.dropdown.perfil>a b.caret,.navmenu-default .navmenu-nav>.dropdown.perfil>a:hover b.caret {
	float:right;margin-top:9px;border-top-color:white
}
.navmenu-default .navmenu-nav.dropdown-menu,.navbar-default .navbar-offcanvas .navmenu-nav.dropdown-menu {
	border-bottom:1px #e7e7e7 solid;background-color:white
}
.navmenu-nav>li {
	color:#777
}
.dropdown-header {padding: 6px 20px 3px 20px}
.navmenu-icon {padding: 6px 0 6px 15px}
.navmenu-icon,.navmenu-default .navmenu-nav>li>a.navmenu-link-with-icon,.navmenu-default .navmenu-nav>li>a:hover.navmenu-link-with-icon {
	display:inline-block;font-weight:400;color:inherit
}
/***BODY***/
@media (min-width: 1199px) {body {padding-top: 75px}}
@media (max-width: 1199px) {body {padding-top: 65px}}
/***ALERT***/
div.alert{border-radius:2px}
/***TABLE***/
#myTable,.panel.table-responsive{margin-bottom:0}
#myTable>thead>tr>th {vertical-align:middle;border-bottom:none;white-space:nowrap;font-weight:normal;background-color:#2196F3}
th,th>a {color: white}
th,td {text-align:center}
th a,th a:hover,th a:focus {color:white;text-decoration:none}
/***LABEL***/
span.Reparar {background-color:#f44336}
span.Uso {background-color:#4CAF50}
span.Baja {background-color:#212121}
span.Descarte {background-color:#795548}
span.Donacion {background-color:#FFC107}
span.Evaluar {background-color:#2196F3}
label {font-weight:normal}
/***DROPDOWN MENU***/
.dropdown-menu>li>a {font-weight:300}
/***ICON***/
[class^="mdi-"], [class*="mdi-"] {font-size:1em}
.big-icon {font-size:2em}
a[class^="mdi-"], a[class*="mdi-"] {text-decoration:none}
.navbar .navbar-nav>li>a.bien{color:#BCAAA4;font-size:20px}
.navbar .navbar-nav>li>a.estadistica{color:#A5D6A7;font-size:20px}
.navbar .navbar-nav>li>a.persona{color:#90CAF9;font-size:20px}
.navbar .navbar-nav>li>a.area{color:#FFCC80;font-size:20px}
.navbar .navbar-nav>li>a.ubicacion{color:#EF9A9A;font-size:20px}
.navmenu .navmenu-nav>li.active {background-color:#E6E6E6}
.navmenu .navmenu-nav>li.active.bien,.navmenu .navmenu-nav>li.bien:hover{color:#795548}
.navmenu .navmenu-nav>li.active.estadistica,.navmenu .navmenu-nav>li.estadistica:hover{color:#4CAF50}
.navmenu .navmenu-nav>li.active.persona,.navmenu .navmenu-nav>li.persona:hover{color:#2196F3}
.navmenu .navmenu-nav>li.active.area,.navmenu .navmenu-nav>li.area:hover{color:#FF5722}
.navmenu .navmenu-nav>li.active.ubicacion,.navmenu .navmenu-nav>li.ubicacion:hover{color:#F44336}
/***FORM***/
div[class^="col-"] {margin-bottom:15px}
.form-group:last-child,
.form-horizontal .form-group:last-child>div[class^="col-"]:last-child {margin-bottom:0px}
.form-horizontal .control-label {padding-top:4px}
span.checkbox-material {margin-right:10px}
/***MODAL***/
.modal-title {font-weight:500}
.modal-content .modal-body {padding:16px 24px}
/***PANEL***/
.panel-body:not(:last-child) {padding-bottom:0}
.panel-footer{text-align:right;border-top:0;background-color:white}
/***LIST***/
.list-group {margin-bottom:0}
.list-group .list-group-item .list-group-item-heading {font-size:14px;font-weight:400}
